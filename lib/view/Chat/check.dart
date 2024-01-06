import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/extentions.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatDetailsModel.dart';
import 'package:alpersonalcoachingapp/view/Chat/SocketService.dart';
import 'package:alpersonalcoachingapp/view/Chat/chatsapi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp111 extends StatelessWidget {
  const MyApp111({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = new ScrollController();
  List<Map> list = [
    {
      "time": "2020-06-16T10:31:12.000Z",
      "message":
          "P2 BGM-01 HV buiten materieel (Gas lekkage) Franckstraat Arnhem 073631"
    },
    {
      "time": "2020-06-16T10:29:35.000Z",
      "message": "A1 Brahmslaan 3862TD Nijkerk 73278"
    },
    {
      "time": "2020-06-16T10:29:35.000Z",
      "message": "A2 NS Station Rheden Dr. Langemijerweg 6991EV Rheden 73286"
    },
    {
      "time": "2020-06-15T09:41:18.000Z",
      "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
    },
    {
      "time": "2020-06-14T09:40:58.000Z",
      "message":
          "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
    },
    {
      "time": "2020-06-18T09:40:58.000Z",
      "message":
          "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
    },
    {
      "time": "2020-06-18T09:40:58.000Z",
      "message":
          "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
    },
    {
      "time": "2020-06-18T09:40:58.000Z",
      "message":
          "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
    },
    {"time": "2023-12-06T09:40:58.000Z", "message": "B2AAZ Rit: 66570"}
  ];
  @override
  void initState() {
    super.initState();
    SocketService.connectAndListen();
    // getChatDataRoom();
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
              list.add({
                "time": chatDetailsModel.data![i].createdAt.toString(),
                "message": chatDetailsModel.data![i].message
              });
              // setMessage(
              //     chatDetailsModel.data![i].autherDetail!.userType.toString(),
              //     chatDetailsModel.data![i].message,
              //     chatDetailsModel.data![i].id.toString(),
              //     chatDetailsModel.data![i].file.toString(),
              //     formattedTime,
              //     dt.microsecondsSinceEpoch.toString());
            });
          }
        }
      }
    } else {}
  }

  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: AppColors.backgroundColorLight),
      //   centerTitle: false,
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 8.0),
      //     child: Row(
      //       children: [
      //         CircleAvatar(
      //           radius: 3.h,
      //           backgroundColor: AppColors.whiteColor.withOpacity(0.2),
      //           child: GestureDetector(
      //             onTap: () {},
      //             child: CircleAvatar(
      //               backgroundColor: AppHelper.themelight
      //                   ? AppColors.primarycolorYellow
      //                   : AppColors.primarycolor,
      //               radius: 2.6.h,
      //               backgroundImage: APIURL.traineprofile != null
      //                   ? NetworkImage(APIURL.imageurl + APIURL.traineprofile!)
      //                   : AssetImage(
      //                       AppImages.profile,
      //                     ) as ImageProvider,
      //             ),
      //           ),
      //         ).ripple(() {},
      //             borderRadius: BorderRadius.all(Radius.circular(13))),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(APIURL.trainerName ?? '',
      //                 style: AppHelper.themelight
      //                     ? AppStyle.cardtitledark.copyWith(fontSize: 16.sp)
      //                     : AppStyle.cardtitle.copyWith(fontSize: 16.sp)),
      //             Text(APIURL.trainerStatus,
      //                 style: AppHelper.themelight
      //                     ? AppStyle.cardsubtitledark.copyWith(fontSize: 15.sp)
      //                     : AppStyle.cardsubtitle.copyWith(fontSize: 15.sp))
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
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

                    list.insert(0, {
                      "time": DateTime.now(),
                      "message": messageController.text.toString()
                    });
                  }

                  messageController.clear();
                  setState(() {});
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
      body: Center(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              bool isSameDate = true;
              final String dateString = list[index]['time'];
              final DateTime date = DateTime.parse(dateString);

              final item = list[index];

              if (index == 0) {
                isSameDate = false;
              } else {
                final String prevDateString = list[index - 1]['time'];
                final DateTime prevDate = DateTime.parse(prevDateString);
                isSameDate = date.isSameDate(prevDate);
              }
              if (index == 0 || !(isSameDate)) {
                return Column(children: [
                  Text(date.formatDate()),
                  ListTile(title: Text('item $index'))
                ]);
              } else {
                return ListTile(title: Text('item '));
              }
            }),
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

  bool isSameDate(DateTime other) 
  {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow()
   {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
