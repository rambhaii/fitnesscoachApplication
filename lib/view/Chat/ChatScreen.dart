import 'dart:convert';
import 'dart:io';

import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/extentions.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatDetailsModel.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatViewModel.dart';
import 'package:alpersonalcoachingapp/view/Chat/MessageModel.dart';
import 'package:alpersonalcoachingapp/view/Chat/SingleImageView.dart';
import 'package:alpersonalcoachingapp/view/Chat/SocketService.dart';
import 'package:alpersonalcoachingapp/view/Chat/chatsapi.dart';

class ChatScreen extends StatefulWidget {
  final String name, image;
  const ChatScreen({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chattingcontroller = TextEditingController();
  bool chatstatus = true;
  final ScrollController _scrollController = ScrollController();

  var chatViewModel = <ChatViewModel>[];
  List<MessageModel> messages = [];
  String base64Image = "";
  String time = "";

  @override
  void initState() {
    super.initState();
    SocketService.connectAndListen();

    getChatDataRoom();
    print("fghghjhjk " + DateTime.now().microsecondsSinceEpoch.toString());
    print("fghghjhjk " +
        DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 1, 11, 30)
            .microsecondsSinceEpoch
            .toString());
  }

  Future getChatDataRoom() async {
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
          for (int i = 0; i < chatDetailsModel.data!.length; i++) {
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
              setMessage(
                  chatDetailsModel.data![i].autherDetail!.userType.toString(),
                  chatDetailsModel.data![i].message,
                  chatDetailsModel.data![i].id.toString(),
                  chatDetailsModel.data![i].file.toString(),
                  formattedTime,
                  chatDetailsModel.data![i].createdAt.toString());
            });
          }
        }
      }
    } else {}
  }

  void setMessage(String type, var message, String chatId, String img,
      String time, String date) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: time,
        chatId: chatId,
        img: img,
        date: date);

    messages.add(messageModel);
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
          SocketService.sendMessage(chattingcontroller.text, base64Image);

          setState(() {
            setMessage(
                "source",
                null,
                "1",
                base64Image,
                DateFormat('kk:mm').format(DateTime.now()),
                DateTime.now().microsecondsSinceEpoch.toString());
            //Navigator.of(context).pop();
          });
        }
      }
    } on Exception catch (e) {
      print("cxjkbjvkbsdjv" + e.toString());
    }
  }

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
            SocketService.sendMessage(chattingcontroller.text, base64Image);
            setMessage(
                "source",
                null,
                "1",
                base64Image,
                DateFormat('kk:mm').format(DateTime.now()),
                DateTime.now().microsecondsSinceEpoch.toString());
            //Navigator.of(context).pop();
          });
        }
        print("cxjkbjvkbsdjv" + base64Image);
      }
    } on Exception catch (e) {
      print("cxjkbjvkbsdjv    " + e.toString());
    }
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static DateTime returnDateAndTimeFormat(String time) {
    print("sdjkhfg   ${time}");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
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
                        backgroundImage: AppHelper.userAvatar != null
                            ? NetworkImage(
                                APIURL.imageurl + AppHelper.userAvatar!)
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
                      Text(Languages.of(context)!.trainerName,
                          style: AppHelper.themelight
                              ? AppStyle.cardtitledark.copyWith(fontSize: 16.sp)
                              : AppStyle.cardtitle.copyWith(fontSize: 16.sp)),
                      Text(Languages.of(context)!.online,
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                                  .copyWith(fontSize: 15.sp)
                              : AppStyle.cardsubtitle.copyWith(fontSize: 15.sp))
                    ],
                  )
                ],
              ),
            ),
            StreamBuilder(
              stream: SocketService.getResponse,
              builder: (BuildContext context,
                  AsyncSnapshot<ChatViewModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          physics: BouncingScrollPhysics(),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            bool isSameDate = true;
                            final String dateString =
                                messages[index].date.toString();
                            final DateTime date = DateTime.parse(dateString);

                            final item = messages[index];

                            if (index == 0) {
                              isSameDate = false;
                            } else {
                              final String prevDateString =
                                  messages[index - 1].date.toString();
                              final DateTime prevDate =
                                  DateTime.parse(prevDateString);
                              isSameDate = date.isSameDate(prevDate);
                            }
                            if (index == 0 || !(isSameDate)) {
                              return Column(children: [
                                Text(date.formatDate()),
                                ListTile(title: Text('item $index'))
                              ]);
                            } else {
                              return ListTile(
                                  title: Text(
                                      'item $index' + messages[index].message));
                            }
                          }));
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    print("fkjdhgkfdghkfgdh  ");
                    DateTime parseDate =
                        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                            .parse(snapshot.data!.createdAt.toString());

                    var inputDate = DateTime.parse(parseDate.toString());

                    String formattedTime =
                        DateFormat('kk:mm').format(inputDate);

                    DateTime dt =
                        DateTime.parse(snapshot.data!.createdAt.toString());

                    setMessage(
                        "Customer",
                        snapshot.data!.message.toString(),
                        snapshot.data!.id.toString(),
                        snapshot.data!.file.toString(),
                        formattedTime,
                        dt.microsecondsSinceEpoch.toString());

                    return Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            //reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  MessageBubble(
                                      index: index,
                                      message: messages[index].message,
                                      isSeen: false,
                                      isMe: false,
                                      time: messages[index].time.toString(),
                                      onPress: () {},
                                      type: messages[index].type.toString(),
                                      img: messages[index].img,
                                      isDate: true,
                                      date: ""),
                                ],
                              );
                            }));
                  }
                } else {
                  return Text("Somthing went wrong");
                }

                return Container(
                  child: Text("Hiiiiiii"),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
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
                                child: TextField(
                                  controller: chattingcontroller,
                                  onChanged: (value) {},
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
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
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (builder) => bottomSheet());
                                  },
                                  child: Icon(
                                    Icons.attach_file,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                  onTap: () async {
                                    showOptionDailog(context);
                                  },
                                  child: Icon(Icons.camera_alt,
                                      color: Colors.black)),
                              SizedBox(
                                width: 2.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.send,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut);

                      setState(() {
                        print("dfjkg  " + chattingcontroller.text);
                        if (chattingcontroller.text.isNotEmpty) {
                          SocketService.sendMessage(
                              chattingcontroller.text, "");
                          setMessage(
                              "source",
                              chattingcontroller.text,
                              "1",
                              "",
                              DateFormat('kk:mm').format(DateTime.now()),
                              DateTime.now().microsecondsSinceEpoch.toString());
                        }

                        chatstatus = false;
                        chattingcontroller.clear();
                        chattingcontroller.text = '';
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {super.key,
      required this.isMe,
      required this.message,
      required this.time,
      required this.onPress,
      required this.index,
      required this.isSeen,
      required this.type,
      required this.img,
      required this.isDate,
      required this.date});

  final bool isMe;
  var message;
  String type;
  final String time;
  final VoidCallback onPress;
  int index;
  bool isSeen;
  var img;
  bool isDate;
  String date;

  @override
  Widget build(BuildContext context) {
    print('djfgjhds ${date}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: type == "Trainer"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 2,
          ),
          Center(
              child: date.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(date),
                      ))
                  : Center()),
          Align(
            alignment: type == "Trainer"
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: InkWell(
              onTap: onPress,
              child: Material(
                  elevation: 1,
                  color: type == "Trainer"
                      ? AppHelper.themelight
                          ? AppColors.primarycolorYellow
                          : AppColors.secondprimarycolor
                      : AppHelper.themelight
                          ? AppColors.primarycolorYellow
                          : AppColors.primarycolor,
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  child: message != null
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Column(
                            children: [
                              Text(
                                message,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                        .copyWith(fontSize: 15.sp)
                                    : AppStyle.cardsubtitle1
                                        .copyWith(fontSize: 15.sp),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  time.toString(),
                                  textAlign: TextAlign.right,
                                  style: AppHelper.themelight
                                      ? AppStyle.cardsubtitledark
                                          .copyWith(fontSize: 11.sp)
                                      : AppStyle.cardsubtitle1
                                          .copyWith(fontSize: 11.sp),
                                ),
                              ),
                            ],
                          ),
                        )
                      : message != null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SingleImageView(img.toString())),
                                );
                              },
                              child: img != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.memory(
                                          base64.decode(img.toString()),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .2,
                                          fit: BoxFit.cover))
                                  : Center(),
                            )),
            ),
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
