
// import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/VideoPlay.dart';
// import 'package:flutter/material.dart';

// import 'package:responsive_sizer/responsive_sizer.dart';

// class WatchVideo extends StatefulWidget {
//   final Function? callback;
//   final String? url;
//   const WatchVideo({
//     super.key,
//     this.url,
//     this.callback,
//   });

//   @override
//   State<WatchVideo> createState() => _WatchVideoState();
// }

// class _WatchVideoState extends State<WatchVideo> {
//   @override
//   Widget build(BuildContext context) {
//     print("dfoiggfh" + widget.url.toString());

//     return SizedBox(
//       height: 35.h,
//       width: 100.h,
//       child: Stack(
//         children: [
//           SizedBox(
//               height: 30.h,
//               child: PalyVideoYoutubeScreen(
//                 url: widget.url!,
//               )),
//           Positioned(
//             width: 45,
//             left: 12,
//             top: 45,
//             child: Container(
//               width: 4.w,
//               height: 4.h,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                   color: Colors.brown.withOpacity(0.5)),
//               child: InkWell(
//                 onTap: () {
//                   print("dlkfjhgkjfhg");
//                   Navigator.pop(context);
//                 },
//                 child: SizedBox(
//                   width: 5.w,
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                     size: 25,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
