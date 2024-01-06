import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/provider/TrainingProvider.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../api/apphelper.dart';
import '../../utils/appColors.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Chat/MessageModel.dart';

class contactsupport extends StatefulWidget {
  const contactsupport({super.key});

  @override
  State<contactsupport> createState() => _contactsupportState();
}

class _contactsupportState extends State<contactsupport> {
  TextEditingController currentpasswordController = TextEditingController();

  sendMessage() async {
    var data = {
      'question': currentpasswordController.text,
    };
    print(data.toString());

    LoginApi registerresponse = LoginApi(data);

    final response = await registerresponse.contactsuport();

    if (response['status'] == "success") {
      currentpasswordController.clear();
      DialogHelper.showFlutterToast(
          strMsg: Languages.of(context)!.answerconatc);
    }
  }

  TrainingProvider _trainingProvider = TrainingProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    _trainingProvider = Provider.of<TrainingProvider>(context, listen: false);
    _trainingProvider.getContactModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppHelper.themelight
              ? AppColors.primarycolorYellow
              : AppColors.primarycolor,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            Languages.of(context)!.contactsupport,
            style: AppHelper.themelight
                ? AppStyle.cardtitledark
                    .copyWith(fontSize: 18.sp, color: AppColors.blackColor)
                : AppStyle.cardtitle
                    .copyWith(fontSize: 18.sp, color: AppColors.blackColor),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 35.h,
                child: TextFormScreen(
                  textEditingController: currentpasswordController,
                  hinttext: Languages.of(context)!.writemessage,
                  icon: Icons.contact_support,
                  validator: AppValidator.currentpasswordValidator,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.send,
                  size: 28,
                  color: AppHelper.themelight
                      ? AppColors.primarycolorYellow
                      : AppColors.primarycolor,
                ),
                onTap: () {
                  sendMessage();
                  FocusManager.instance.primaryFocus?.unfocus();

                  // _scrollController.animateTo(
                  //     _scrollController.position.maxScrollExtent,
                  //     duration: Duration(milliseconds: 300),
                  //     curve: Curves.easeOut);
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      
      
        body: Consumer<TrainingProvider>(
            builder: ((context, trainingProvider, child) {
          return Padding(
            padding:
                EdgeInsets.only(top: 2.h, right: 2.h, left: 2.h, bottom: 3.h),
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: trainingProvider.conatctDatalist!.length,
                  itemBuilder: (context, i) {
                    final data = trainingProvider.conatctDatalist[i];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                  color: AppHelper.themelight
                                      ? AppColors.primarycolorYellow
                                          .withOpacity(0.5)
                                      : AppColors.primarycolor.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(0)),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Q. " + data.question.toString(),
                                          style: AppHelper.themelight
                                              ? AppStyle.cardsubtitledark
                                                  .copyWith(fontSize: 15.sp)
                                              : AppStyle.cardsubtitle1
                                                  .copyWith(fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "Ans. " + data.answer.toString(),
                                          style: AppHelper.themelight
                                              ? AppStyle.cardsubtitledark
                                                  .copyWith(fontSize: 15.sp)
                                              : AppStyle.cardsubtitle1
                                                  .copyWith(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ))

                              // Text(data.answer.toString(),
                              //     style: AppHelper.themelight
                              //         ? AppStyle.cardtitledark.copyWith(
                              //             fontSize: 16.sp,
                              //             fontWeight: FontWeight.w400,
                              //             color: AppHelper.themelight
                              //                 ? AppColors.primarycolorYellow
                              //                 : AppColors.primarycolor)
                              //         : AppStyle.cardtitle.copyWith(
                              //             fontSize: 16.sp,
                              //             color: AppHelper.themelight
                              //                 ? AppColors.primarycolorYellow
                              //                 : AppColors.primarycolor,
                              //           )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Column(

              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children:
              //    [
              //     Text(Languages.of(context)!.previous_support,
              //         style: AppHelper.themelight
              //             ? AppStyle.cardtitledark.copyWith(
              //                 fontSize: 16.sp,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppHelper.themelight
              //                     ? AppColors.primarycolorYellow
              //                     : AppColors.primarycolor)
              //             : AppStyle.cardtitle.copyWith(
              //                 fontSize: 16.sp,
              //                 color: AppHelper.themelight
              //                     ? AppColors.primarycolorYellow
              //                     : AppColors.primarycolor,
              //               )),

              //   ],
              // ),
            ),
          );
        })));
  }
}
