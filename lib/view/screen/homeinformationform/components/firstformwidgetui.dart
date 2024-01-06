// import 'package:alpersonalcoachingapp/utils/appColors.dart';
// import 'package:alpersonalcoachingapp/utils/app_validator.dart';
// import 'package:alpersonalcoachingapp/utils/appstyle.dart';
// import 'package:alpersonalcoachingapp/utils/informationform.dart';
// import 'package:clay_containers/widgets/clay_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class FirstFormwidgetui extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData? icon;
//  // final TextEditingController textEditingController;

//   final Function()? onTap;
//   const FirstFormwidgetui(
//       {super.key,
//       required this.title,
//       required this.subtitle,
//      //   required this.textEditingController,
//       this.icon,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title,
//          // "Rumpa*",
//           // Languages.of(context)!.enterdescription,
//           style: AppStyle.cardtitle.copyWith(color: Colors.black),
//         ),
//         InformationTextFormScreen(
//           hinttext: subtitle,
//           keyboardType: TextInputType.number,
//           icon: Icons.bubble_chart,
//         //  controller: textEditingController,
//     // textEditingController: ,
                         
//           validator: AppValidator.lastnameValidator,
//         ),
//       ],
//     );
//   }
// }
