// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationUtils {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  requestingPermissionForIOS() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  Future showNotification(RemoteMessage message) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    AndroidNotification? android = message.notification?.android;
    RemoteNotification? notification = message.notification;
    handleMessage(message);

    print("fdlkhgj   ${message!.messageType}");
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification!.title,
      notification.body,
      NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android?.smallIcon,
            // other properties...
          ),
          // iOS: IOSNotificationDetails(presentAlert: true, presentSound: true),
          iOS: DarwinNotificationDetails(
              presentAlert: true, presentSound: true)),
      payload: 'Default_Sound',
    );
  }

  initfirebasesetting() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
  }

  Future selectNotification(String? payload) async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void handleMessage(RemoteMessage message) {
    /* print("dfhdfgfgfghfhgkj");
   print(message.data['type']);
   print("dfhdfgfgfghfhgkj");
    if(int.parse(message.data['type'].toString()) <=3)
   {*/
    // Get.to(() => CommunityDetails(cid: message.data['community_id'],));

    /* Navigator.push(context,
          MaterialPageRoute(builder: (context) => MessageScreen
          (
            id: message.data['id'] ,
          )));*/
    // }

    // makingPhoneCall(String call) async {
    //   var url = Uri.parse(Platform.isIOS ? 'tel://$call' : 'tel:$call');
    //   if (await canLaunchUrl(url)) {
    //     await launchUrl(url);
    //   } else {
    //     print(url);
    //     throw 'Could not launch $url';
    //   }
    // }
  }
}
