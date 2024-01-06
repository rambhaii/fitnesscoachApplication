import 'dart:convert';
import 'dart:io';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/profilemodel.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  final List<ProfileUserData>? profileuserdata;
  const EditProfile({Key? key, this.profileuserdata}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (widget.profileuserdata!.isNotEmpty) {
      firstnameController.text = widget.profileuserdata![0].firstName ?? '';
      lastnameController.text = widget.profileuserdata![0].lastName ?? '';
      emailController.text = widget.profileuserdata![0].emailAddress ?? '';
      mobileController.text = widget.profileuserdata![0].phoneNumber.toString();
    }
    super.initState();
  }

  Future submitupdate() async {
    if (imagefiles != null) {
      var url = Uri.parse(APIURL.USERPROFILEUPDATE + AppHelper.userid!);

      final request = http.MultipartRequest('PUT', url);
      Map<String, String> headers = {
        "Authorization": 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}'
      };
      print(imagefiles!.path);
      request.headers.addAll(headers);
      print(request.headers);

      final file = await http.MultipartFile.fromPath('userAvatar', imagefiles!.path);

      request.files.add(file);
      request.fields['firstName'] = firstnameController.text;
      request.fields['lastName'] = lastnameController.text;
      request.fields['phoneNumber'] = mobileController.text;
      request.fields['emailAddress'] = emailController.text;

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        var out = jsonDecode(response.body);
        if (out['status'] == "success") {
          DialogHelper.showFlutterToast(strMsg: out['message']);
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
      }
    } else {
      var data = {
        'firstName': firstnameController.text,
        'lastName': lastnameController.text,
        'phoneNumber': mobileController.text,
        'emailAddress': emailController.text,
      };
      print(data.toString());

      LoginApi registerresponse = LoginApi(data);

      final response = await registerresponse.updateprofile();

      print(response);
      if (response['status'] == "success") {
        DialogHelper.showFlutterToast(strMsg: response['message']);
        Navigator.pop(context);
      }
    }
  }

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =await imgpicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagefiles = image;
        setState(() {});
      } else 
      {
        DialogHelper.showFlutterToast( strMsg: Languages.of(context)!.imageNotSelected);
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.editprofile,
          )),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(2.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 6.h,
                      backgroundColor: AppColors.greyColor.withOpacity(0.3),
                      child: CircleAvatar(
                        radius: 5.5.h,
                        backgroundImage: imagefiles != null
                            ? FileImage(File(imagefiles!.path))
                            : widget.profileuserdata![0].userAvatar != null
                                ? NetworkImage(APIURL.imageurl +
                                    widget.profileuserdata![0].userAvatar
                                        .toString())
                                : AssetImage(AppImages.profile)
                                    as ImageProvider,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              openImages();
                            },
                            child: CircleAvatar(
                              radius: 2.h,
                              backgroundColor: AppColors.primarycolor,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.firstname,
                                style: AppHelper.themelight
                                    ? AppStyle.cardtitledark
                                    : AppStyle.cardtitle),
                          ],
                        ),
                        TextFormScreen(
                          hinttext: Languages.of(context)!.firstname,
                          icon: Icons.account_circle,
                          textEditingController: firstnameController,
                          validator: AppValidator.nameValidator,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.lastname,
                                style: AppHelper.themelight
                                    ? AppStyle.cardtitledark
                                    : AppStyle.cardtitle),
                          ],
                        ),
                        TextFormScreen(
                          hinttext: Languages.of(context)!.lastname,
                          icon: Icons.account_circle,
                          textEditingController: lastnameController,
                          validator: AppValidator.lastnameValidator,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.email,
                                style: AppHelper.themelight
                                    ? AppStyle.cardtitledark
                                    : AppStyle.cardtitle),
                          ],
                        ),
                        TextFormScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.email,
                          icon: Icons.mail,
                          textEditingController: emailController,
                          validator: AppValidator.emailValidator,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.mobile,
                                style: AppHelper.themelight
                                    ? AppStyle.cardtitledark
                                    : AppStyle.cardtitle),
                          ],
                        ),
                        TextFormScreen(
                          keyboardType: TextInputType.phone,
                          hinttext: Languages.of(context)!.mobile,
                          icon: Icons.phone_android_rounded,
                          textEditingController: mobileController,
                          validator: AppValidator.mobileValidator,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ButtonWidget(
                    text: Languages.of(context)!.update,
                    onTap: () {
                      if (isLoading) {
                        return;
                      }

                      update(
                        firstnameController.text,
                        lastnameController.text,
                        emailController.text,
                        mobileController.text,
                      );

                      submitupdate();
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: Center(child: LoaderScreen()),
            )
        ],
      ),
    );
  }

  update(firstname, lastname, email, mobile) async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      //DialogHelper.showFlutterToast(strMsg: "Profile Update Successfully!");
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
