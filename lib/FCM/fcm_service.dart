import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

const localNotificationChannel = "high_importance_channel";
const localNotificationChannelTitle = "High Importance Channel";
const localNotificationChannelDescription =
    "This channel is used for importance notifications";

class FCMService {
  
  static final FCMService _singleton = FCMService._internal();
  factory FCMService() {
    return _singleton;
  }
  FCMService._internal();

  ///FirebaseMessagin Instance
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void listenForMessages() async {
    messaging.getToken().then((fcmToken) {
      debugPrint("FCM Token for Device==>$fcmToken");
    });
  }
}
