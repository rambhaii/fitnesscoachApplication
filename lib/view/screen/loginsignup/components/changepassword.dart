// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:halsogourmet/api/loginapi.dart';
// import 'package:halsogourmet/auth/login.dart';
// import 'package:halsogourmet/screens/home/homescreen.dart';
// import 'package:halsogourmet/page_routes/routes.dart';
// import 'package:halsogourmet/utils/button_widget.dart';
// import 'package:halsogourmet/utils/colors.dart';
// import 'package:halsogourmet/utils/image_file.dart';
// import 'package:halsogourmet/utils/mainbar.dart';
// import 'package:halsogourmet/utils/style_file.dart';
// import 'package:halsogourmet/utils/textform.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../utils/buttonwidgetloader.dart';
// import '../utils/dialog_helper.dart';
// import 'app_validator.dart';

// class ChangePassword extends StatefulWidget {
//   final String? id;
//   final String? password;
//   final String? userid;
//   final String? pagetype;
//   const ChangePassword(
//       {Key? key, this.id, this.password, this.pagetype, this.userid})
//       : super(key: key);

//   @override
//   State<ChangePassword> createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isValid = false;

//   late ScaffoldMessengerState scaffoldMessenger;

//   bool isLoading = false;

//   bool _obscureText = true;
//   bool _obscureText1 = true;

//   String _error = '';

//   TextEditingController currentpasswordController = TextEditingController();
//   TextEditingController newpasswordController = TextEditingController();
//   TextEditingController confirmnewpasswordController = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: colorBlack,
//         ),
//         backgroundColor: colorWhite,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 0.1.h, left: 2.0.h, right: 2.0.h),
//           child: Column(
//             children: <Widget>[
//               MainBar(text: "Ändra lösenord"),
//               SizedBox(
//                 height: 1.h,
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     TextFormScreen(
//                       textEditingController: currentpasswordController,
//                       hinttext: "Nuvarande lösenord",
//                       // suffixIcon: true,
//                       icon: Icons.lock,
//                       // obscure: _obscureText1,
//                       // onPressed: _toggle1,

//                       validator: AppValidator.currentpasswordValidator,
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     TextFormScreen(
//                       textEditingController: newpasswordController,
//                       hinttext: "nytt lösenord",
//                       suffixIcon: true,
//                       icon: Icons.lock,
//                       obscure: _obscureText,
//                       onPressed: _toggle,
//                       validator: AppValidator.passwordValidator,
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     TextFormScreen(
//                       textEditingController: confirmnewpasswordController,
//                       hinttext: "Bekräfta nytt lösenord",
//                       suffixIcon: true,
//                       icon: Icons.lock,
//                       obscure: _obscureText1,
//                       onPressed: _toggle1,
//                       validator: AppValidator.confirm_passwordValidator,
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                     Text(
//                       _error,
//                       style: Style_File.subtitle
//                           .copyWith(color: Colors.red, fontSize: 15.sp),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               !isLoading
//                   ? ButtonWidget(
//                       text: 'BEKRÄFTA',
//                       onTap: () {
//                         setState(() {
//                           _error = '';
//                         });
//                         if (isLoading) {
//                           return;
//                         }

//                         resetPassword(
//                             currentpasswordController.text,
//                             newpasswordController.text,
//                             confirmnewpasswordController.text);
//                       },
//                     )
//                   : ButtonWidgetLoader(),
//               SizedBox(height: 5.h),
//               _isValid
//                   ? const Text(
//                       'Ändra lösenord framgångsrikt!',
//                       style: TextStyle(
//                         color: Colors.green,
//                         fontFamily: 'Amazon',
//                         fontSize: 15,
//                       ),
//                     )
//                   : Container(),
//               SizedBox(
//                 height: 5.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   void _toggle1() {
//     setState(() {
//       _obscureText1 = !_obscureText1;
//     });
//   }

//   resetPassword(String currentpassword, String newpassword,
//       String confirmnewpassword) async {
//     final bool isConnected = await InternetConnectionChecker().hasConnection;
//     if (isConnected) {
//       if (_formKey.currentState!.validate()) {
//         if (newpasswordController.text == confirmnewpasswordController.text) {
//           if (currentpasswordController.text != newpasswordController.text) {
//             var data = {
//               //'id': widget.id,
//               'currentPassword': currentpassword.toString().trim(),
//               'newPassword': newpassword.toString().trim(),
//               'confirmnewpassword': confirmnewpassword.toString().trim()

//               // 'email': widget.email,
//             };

//             LoginApi registerresponse = LoginApi(data);
//             var response = await registerresponse.changepassword();
//             print(response);
//             setState(() {
//               isLoading = false;
//             });

//             if (response['status'].toString() == 'success') {
//               setState(() {
//                 isLoading = false;
//               });

//               DialogHelper.showFlutterToast(
//                   strMsg: "User New Lösenord Updated!!");
//               // Navigator.pushReplacementNamed(context, Routes.loginScreen);

//               Navigator.pop(context);
//             } else {
//               DialogHelper.showFlutterToast(
//                   strMsg: "Current Lösenord is Incorrect");
//             }
//           } else {
//             setState(() {
//               _error = "Current Lösenord and new Lösenord should not be same";
//               isLoading = false;
//             });
//             DialogHelper.showFlutterToast(
//                 strMsg: "Current Lösenord and new Lösenord should not be same");
//           }
//         } else {
//           setState(() {
//             _error = "New Lösenord and current Lösenord must be not match";
//             isLoading = false;
//           });
//           DialogHelper.showFlutterToast(
//               strMsg: "New Lösenord and current Lösenord must be not match");
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } else {
//       setState(() {
//         isLoading = false;
//       });

//       DialogHelper().shoppopDialog(context);
//     }
//   }


// }
