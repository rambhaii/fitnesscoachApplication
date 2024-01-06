import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/extentions.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatDetailsModel.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatViewModel.dart';
import 'package:alpersonalcoachingapp/view/Chat/SocketService.dart';
import 'package:alpersonalcoachingapp/view/Chat/chatsapi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageGroupingWithTimeStamp extends StatefulWidget {
  const MessageGroupingWithTimeStamp({Key? key}) : super(key: key);

  @override
  State<MessageGroupingWithTimeStamp> createState() =>
      _MessageGroupingWithTimeStampState();
}

class _MessageGroupingWithTimeStampState
    extends State<MessageGroupingWithTimeStamp> {
  //message controller
  final messageController = TextEditingController();

  //scroll controller
  ScrollController _scrollController = new ScrollController();

  List<MessageModel> messagesList = [];
  @override
  void initState() {
    super.initState();
    SocketService.connectAndListen();
    getChatData();
  }

  int count = 0;

  Future getChatData() async {
    var data = {
      "doctorId": APIURL.chatroomId,
    };
    print("doctorId" + APIURL.chatroomId);
    chatsapi responsedata = chatsapi(data);

    final response = await responsedata.getallChat(APIURL.chatroomId);

    if (response['status'] == "success") {
      ChatDetailsModel chatDetailsModel = ChatDetailsModel.fromJson(response);

      if (chatDetailsModel.data != null) {
        if (chatDetailsModel.data!.isNotEmpty) {
          for (int i = chatDetailsModel.data!.length - 1; i > 0; i--) {
            DateTime dt =
                DateTime.parse(chatDetailsModel.data![i].createdAt.toString());
            print("converted gmt date >> " + dt.toString());
            final localTime = dt.toLocal();
            print("local modified date >> " + localTime.toString());

            var inputDate = DateTime.parse(localTime.toString());
            var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

            var outputDate = outputFormat.format(inputDate);

            String formattedTime = DateFormat('kk:mm').format(inputDate);

            setState(() {
              MessageModel model = MessageModel(
                  timeStamp: dt.microsecondsSinceEpoch,
                  isMe: chatDetailsModel.data![i].autherDetail!.userType
                              .toString() ==
                          "Trainer"
                      ? false
                      : true,
                  message: chatDetailsModel.data![i].message.toString());

              messagesList.add(model);
            });
            // setMessage(
            //     chatDetailsModel.data![i].autherDetail!.userType.toString(),
            //     chatDetailsModel.data![i].message,
            //     chatDetailsModel.data![i].id.toString(),
            //     chatDetailsModel.data![i].file.toString(),
            //     formattedTime,
            //     dt.microsecondsSinceEpoch.toString());
          }
        }
      }
    } else {}
  }

  String base64Image = "";
  String time = "";

  // function to convert time stamp to date
  static DateTime returnDateAndTimeFormat(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    var originalDate = DateFormat('MM/dd/yyyy').format(dt);
    return DateTime(dt.year, dt.month, dt.day);
  }

  //function to return message time in 24 hours format AM/PM
  static String messageTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    String difference = '';
    difference = DateFormat('jm').format(dt).toString();
    return difference;
  }

  // function to return date if date changes based on your local date and time
  static String groupMessageDateAndTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    var originalDate = DateFormat('MM/dd/yyyy').format(dt);

    final todayDate = DateTime.now();

    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesterday =
        DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
    String difference = '';
    final aDate = DateTime(dt.year, dt.month, dt.day);

    if (aDate == today) {
      difference = "Today";
    } else if (aDate == yesterday) {
      difference = "Yesterday";
    } else {
      difference = DateFormat.yMMMd().format(dt).toString();
    }

    return difference;
  }

  void setMessage(var message) {
    MessageModel model = MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message: message.toString(),
        isMe: false);
    // since we are reversing the list so we are inserting date at 0 index to append the list
    messagesList.insert(0, model);
    APIURL.trainerStatus = "Online";
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () async {
        setState(() {
          if (text == "Camera") {
            Navigator.of(context).pop();
            showOptionDailog(context);
          } else if (text == "Gallery") {
            Navigator.of(context).pop();
            chooseImgageGa(context);
          } else {
            _pickFile();
          }
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  int length = 0;

  _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
  }

  chooseImgageGa(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
      if (image != null) {
        File imageFile = File(image.path);
        List<int> imageBytes = imageFile.readAsBytesSync();
        base64Image = base64Encode(imageBytes);

        if (base64Image.isNotEmpty) {
          var inputDate = DateTime.parse(DateTime.now().toString());
          var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

          var outputDate = outputFormat.format(inputDate);
          setState(() {
            // SocketService.sendMessage(chattingcontroller.text, base64Image);
            // setMessage(
            //     "source",
            //     null,
            //     "1",
            //     base64Image,
            //     DateFormat('kk:mm').format(DateTime.now()),
            //     DateTime.now().microsecondsSinceEpoch.toString());
            //Navigator.of(context).pop();
          });
        }
        print("cxjkbjvkbsdjv" + base64Image);
      }
    } on Exception catch (e) {
      print("cxjkbjvkbsdjv    " + e.toString());
    }
  }

  showOptionDailog(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 60);
      if (image != null) {
        File imageFile = File(image.path);
        List<int> imageBytes = imageFile.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
        if (base64Image.isNotEmpty) {
          //SocketService.sendMessage(chattingcontroller.text, base64Image);

          // setState(() {
          //   setMessage(
          //       "source",
          //       null,
          //       "1",
          //       base64Image,
          //       DateFormat('kk:mm').format(DateTime.now()),
          //       DateTime.now().microsecondsSinceEpoch.toString());
          //   //Navigator.of(context).pop();
          // });
        }
      }
    } on Exception catch (e) {
      print("cxjkbjvkbsdjv" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.backgroundColorLight),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 3.h,
                backgroundColor: AppColors.whiteColor.withOpacity(0.2),
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: AppHelper.themelight
                        ? AppColors.primarycolorYellow
                        : AppColors.primarycolor,
                    radius: 2.6.h,
                    backgroundImage: APIURL.traineprofile.isNotEmpty
                        ? NetworkImage(APIURL.imageurl + APIURL.traineprofile!)
                        : AssetImage(
                            AppImages.profile,
                          ) as ImageProvider,
                  ),
                ),
              ).ripple(() {},
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(APIURL.trainerName ?? '',
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark.copyWith(fontSize: 16.sp)
                          : AppStyle.cardtitle.copyWith(fontSize: 16.sp)),
                  // Text(APIURL.trainerStatus ?? '',
                  //     style: AppHelper.themelight
                  //         ? AppStyle.cardsubtitledark.copyWith(fontSize: 15.sp)
                  //         : AppStyle.cardsubtitle.copyWith(fontSize: 15.sp))
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              keyboardType: TextInputType.text,
                              maxLines: 8,
                              minLines: 1,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                hintText: Languages.of(context)!.message,
                                hintStyle: TextStyle(
                                  color: Color(0xff8E8E93),
                                ),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // InkWell(
                          //     onTap: () {
                          //       showModalBottomSheet(
                          //           backgroundColor: Colors.transparent,
                          //           context: context,
                          //           builder: (builder) => bottomSheet());
                          //     },
                          //     child: Icon(
                          //       Icons.attach_file,
                          //       color: Colors.black,
                          //     )),
                          // SizedBox(
                          //   width: 2.w,
                          // ),
                          // InkWell(
                          //     onTap: () async {
                          //       showOptionDailog(context);
                          //     },
                          //     child: Icon(Icons.camera_alt,
                          //         color: Colors.black)),

                          SizedBox(
                            width: 2.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (messageController.text.isNotEmpty) {
                    SocketService.sendMessage(messageController.text, "");
                    MessageModel model = MessageModel(
                        timeStamp: DateTime.now().microsecondsSinceEpoch,
                        message: messageController.text.toString(),
                        isMe: true);

                    messagesList.insert(0, model);
                  }

                  messageController.clear();
                  setState(() {});
                  count++;
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: const CircleAvatar(
                  child: Icon(Icons.send),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: SocketService.getResponse,
          builder:
              (BuildContext context, AsyncSnapshot<ChatViewModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(), // ← can't
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    bool isSameDate = false;
                    String? newDate = '';

                    print("index  ${index} ${messagesList.length}");

                    if (index == 0 && messagesList.length == 1)
                     {
                      newDate = groupMessageDateAndTime( messagesList[index].timeStamp.toString()).toString();
                  
                    } else if (index == messagesList.length - 1)
                     {
                      if (count == 1) 
                      {
                        // newDate = groupMessageDateAndTime(DateTime.now()
                        // .microsecondsSinceEpoch
                        // .toString())
                        // .toString();
                      }
                      else 
                      {
                        newDate = groupMessageDateAndTime(messagesList[index].timeStamp.toString())
                            .toString();
                      }
                    } else
                    {
                      final DateTime date = returnDateAndTimeFormat(
                          messagesList[index].timeStamp.toString());
                      final DateTime prevDate = returnDateAndTimeFormat(
                          messagesList[index + 1].timeStamp.toString());
                      isSameDate = date.isAtSameMomentAs(prevDate);

                      if (kDebugMode) 
                      {
                        print("$date $prevDate $isSameDate");
                      }
                      newDate = isSameDate
                          ? ''
                          : groupMessageDateAndTime(
                                  messagesList[index - 1].timeStamp.toString())
                              .toString();
                    }

                    return Column(
                      crossAxisAlignment: messagesList[index].isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (newDate.isNotEmpty)
                          Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primarycolor
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(newDate ?? ""),
                                  ))),

                        // MessageView(
                        //   message: messagesList[index].message.toString(),
                        //   isMe: messagesList[index].isMe,
                        //   timeStamp: messagesList[index].timeStamp.toString(),
                        // )
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CustomPaint(
                            painter: MessageBubble(
                                color: messagesList[index].isMe
                                    ? AppColors.primarycolor.withOpacity(0.2)
                                    : const Color(0xffDAF0F3),
                                alignment: messagesList[index].isMe
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                tail: true),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .7,
                              ),
                              margin: messagesList[index].isMe
                                  ? const EdgeInsets.fromLTRB(7, 7, 17, 7)
                                  : const EdgeInsets.fromLTRB(17, 7, 7, 7),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: messagesList[index].isMe
                                        ? const EdgeInsets.only(
                                            left: 4, right: 4, bottom: 10)
                                        : const EdgeInsets.only(
                                            left: 4, right: 4, bottom: 10),
                                    child: Text(
                                      messagesList[index]
                                                  .message
                                                  .toString()
                                                  .length >
                                              4
                                          ? messagesList[index]
                                                      .message
                                                      .toString() +
                                                  "" ??
                                              ""
                                          : messagesList[index]
                                                      .message
                                                      .toString() +
                                                  "       " ??
                                              "",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 15,
                                              color: messagesList[index].isMe
                                                  ? Color(0xff677D81)
                                                  : const Color(0xff677D81)),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Text(
                                        messageTime(messagesList[index]
                                                    .timeStamp
                                                    .toString())
                                                .toString() ??
                                            '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: AppHelper.themelight
                                                ? AppColors.whiteColor
                                                : AppColors.blackColor),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                setMessage(snapshot.data!.message.toString());

                return ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(), // ← can't
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      bool isSameDate = false;
                      String? newDate = '';

                      //final DateTime date = returnDateAndTimeFormat(messagesList[index].timeStamp.toString());

                      if (index == 0 && messagesList.length == 1) {
                        newDate = groupMessageDateAndTime(
                                messagesList[index].timeStamp.toString())
                            .toString();
                      } else if (index == messagesList.length - 1) {
                        newDate = groupMessageDateAndTime(
                                messagesList[index].timeStamp.toString())
                            .toString();
                      } else {
                        final DateTime date = returnDateAndTimeFormat(
                            messagesList[index].timeStamp.toString());
                        final DateTime prevDate = returnDateAndTimeFormat(
                            messagesList[index + 1].timeStamp.toString());
                        isSameDate = date.isAtSameMomentAs(prevDate);

                        if (kDebugMode) {
                          print("$date $prevDate $isSameDate");
                        }
                        newDate = isSameDate
                            ? ''
                            : groupMessageDateAndTime(messagesList[index - 1]
                                    .timeStamp
                                    .toString())
                                .toString();
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: messagesList[index].isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (newDate.isNotEmpty)
                              Center(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffE3D4EE),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(newDate),
                                      ))),
                            MessageView(
                              message: messagesList[index].message.toString(),
                              isMe: messagesList[index].isMe,
                              timeStamp:
                                  messagesList[index].timeStamp.toString(),
                            )

                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(vertical: 4),
                            //   child: CustomPaint(
                            //     painter: MessageBubble(
                            //         color: messagesList[index].isMe
                            //             ? const Color(0xffE3D4EE)
                            //             : const Color(0xffDAF0F3),
                            //         alignment: messagesList[index].isMe
                            //             ? Alignment.topRight
                            //             : Alignment.topLeft,
                            //         tail: true),
                            //     child: Container(
                            //       constraints: BoxConstraints(
                            //         maxWidth: MediaQuery.of(context)
                            //                 .size
                            //                 .width *
                            //             .7,
                            //       ),
                            //       margin: messagesList[index].isMe
                            //           ? const EdgeInsets.fromLTRB(
                            //               7, 7, 17, 7)
                            //           : const EdgeInsets.fromLTRB(
                            //               17, 7, 7, 7),
                            //       child: Stack(
                            //         children: [
                            //           Padding(
                            //             padding: messagesList[index].isMe
                            //                 ? const EdgeInsets.only(
                            //                     left: 4,
                            //                     right: 4,
                            //                     bottom: 10)
                            //                 : const EdgeInsets.only(
                            //                     left: 4,
                            //                     right: 4,
                            //                     bottom: 10),
                            //             child: Text(
                            //               messagesList[index].message,
                            //               textAlign: TextAlign.left,
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline5!
                            //                   .copyWith(
                            //                       fontSize: 15,
                            //                       color: messagesList[
                            //                                   index]
                            //                               .isMe
                            //                           ? const Color(
                            //                               0xff705982)
                            //                           : const Color(
                            //                               0xff677D81)),
                            //             ),
                            //           ),
                            //           Positioned(
                            //               bottom: 0,
                            //               right: 0,
                            //               child: Text(
                            //                 messageTime(
                            //                         messagesList[index]
                            //                             .timeStamp
                            //                             .toString())
                            //                     .toString(),
                            //                 textAlign: TextAlign.left,
                            //                 style:
                            //                     TextStyle(fontSize: 10),
                            //               ))
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    });
              }
            }

            return Container(
              child: Text("Hiiiiiii"),
            );
          },
        ),
      ),
    );
  }
}

// model for messages
class MessageModel {
  int timeStamp;
  String message;
  bool isMe;
  MessageModel(
      {required this.timeStamp, required this.message, required this.isMe});
}

// creating bubble
class MessageBubble extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  MessageBubble({
    required this.color,
    required this.alignment,
    required this.tail,
  });

  final double _radius = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    if (alignment == Alignment.topRight) {
      if (tail) {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 2, 0);

        /// top-left corner
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        /// left line
        path.lineTo(0, h - _radius * 1.5);

        /// bottom-left corner
        path.quadraticBezierTo(0, h, _radius * 2, h);

        /// bottom line
        path.lineTo(w - _radius * 3, h);

        /// bottom-right bubble curve
        path.quadraticBezierTo(
            w - _radius * 1.5, h, w - _radius * 1.5, h - _radius * 0.6);

        /// bottom-right tail curve 1
        path.quadraticBezierTo(w - _radius * 1, h, w, h);

        /// bottom-right tail curve 2
        path.quadraticBezierTo(
            w - _radius * 0.8, h, w - _radius, h - _radius * 1.5);

        /// right line
        path.lineTo(w - _radius, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 2, 0);

        /// top-left corner
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        /// left line
        path.lineTo(0, h - _radius * 1.5);

        /// bottom-left corner
        path.quadraticBezierTo(0, h, _radius * 2, h);

        /// bottom line
        path.lineTo(w - _radius * 3, h);

        /// bottom-right curve
        path.quadraticBezierTo(w - _radius, h, w - _radius, h - _radius * 1.5);

        /// right line
        path.lineTo(w - _radius, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 3, 0);

        /// top-left corner
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        /// left line
        path.lineTo(_radius, h - _radius * 1.5);
        // bottom-right tail curve 1
        path.quadraticBezierTo(_radius * .8, h, 0, h);

        /// bottom-right tail curve 2
        path.quadraticBezierTo(
            _radius * 1, h, _radius * 1.5, h - _radius * 0.6);

        /// bottom-left bubble curve
        path.quadraticBezierTo(_radius * 1.5, h, _radius * 3, h);

        /// bottom line
        path.lineTo(w - _radius * 2, h);

        /// bottom-right curve
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        /// right line
        path.lineTo(w, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 3, 0);

        /// top-left corner
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        /// left line
        path.lineTo(_radius, h - _radius * 1.5);

        /// bottom-left curve
        path.quadraticBezierTo(_radius, h, _radius * 3, h);

        /// bottom line
        path.lineTo(w - _radius * 2, h);

        /// bottom-right curve
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        /// right line
        path.lineTo(w, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// {@template custom_rect_tween}
/// Linear RectTween with a [Curves.easeOut] curve.
///
/// Less dramatic that the regular [RectTween] used in [Hero] animations.
/// {@endtemplate}
class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required Rect begin,
    required Rect end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}

class MessageView extends StatelessWidget {
  MessageView(
      {super.key,
      required this.isMe,
      required this.message,
      required this.timeStamp}) {
    // TODO: implement MessageView
  }
  var isMe;
  var message;
  var timeStamp;
  static String messageTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    String difference = '';
    difference = DateFormat('jm').format(dt).toString();
    return difference;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CustomPaint(
        painter: MessageBubble(
            color: isMe ? const Color(0xffE3D4EE) : const Color(0xffDAF0F3),
            alignment: isMe ? Alignment.topRight : Alignment.topLeft,
            tail: true),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .7,
          ),
          margin: isMe
              ? const EdgeInsets.fromLTRB(7, 7, 17, 7)
              : const EdgeInsets.fromLTRB(17, 7, 7, 7),
          child: Stack(
            children: [
              Padding(
                padding: isMe
                    ? const EdgeInsets.only(left: 4, right: 4, bottom: 10)
                    : const EdgeInsets.only(left: 4, right: 4, bottom: 10),
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 15,
                      color: isMe
                          ? const Color(0xff705982)
                          : const Color(0xff677D81)),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    messageTime(timeStamp.toString()).toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 10),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
