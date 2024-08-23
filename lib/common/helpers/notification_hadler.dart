import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:provider/provider.dart';
import 'package:risal_customer/common/widgets/custom_snakbar.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Handling a background message: ${message.data}");
  NotificationHandle().handleNotification(message.data);
}

class NotificationHandle {
  static NotificationHandle? _singleton;

  NotificationHandle._internal();

  factory NotificationHandle() {
    _singleton = _singleton ?? NotificationHandle._internal();
    return _singleton!;
  }

  late String fcmToken;
  late final FirebaseMessaging _firebaseMessaging;

  initNotifications() async {
    await messageRequestPermission();
    await getFcmToken();
    initPushNotification();
  }

  initPushNotification() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    onClickOnMessageTerminateHandle();
    onClickOnMessageBackgroundHandle();
    onBackgroundAndTerminateHandle(_firebaseMessagingBackgroundHandler);
    onForegroundHandle();
  }

  getFcmToken() async {
    String? token;
    try {
      token = await _firebaseMessaging.getToken();
      log("fcm token : $token");
    } catch (e) {
      log("fcm token error: $e");
    }
    fcmToken = token ?? "";
  }

  setNewToken() async {
    await deleteToken();
    await getFcmToken();
  }

  deleteToken() async {
    try {
      await _firebaseMessaging.deleteToken();
    } catch (error) {
      log(error.toString());
    }
  }

  messageRequestPermission() async {
    _firebaseMessaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

  onBackgroundAndTerminateHandle(handlingFunction) {
    // used when you need change database or call something not need user to take action on it or click on notification
    FirebaseMessaging.onBackgroundMessage(handlingFunction);
  }

  onForegroundHandle() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Message data: ${message.data}');
      if (message.notification != null && Platform.isAndroid) {
        CustomSnakbar().showAppTopSnackBar(
            title: message.notification!.title.toString(),
            body: message.notification!.body.toString(),
            onClick: () {});
      }
      handleNotification(message.data);
    });
  }

  handleNotification(Map<String, dynamic> messageData) {

  }

  onClickOnMessageTerminateHandle() {
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        log("ClickOnMessageTerminate : $message");
      }
    });
  }

  onClickOnMessageBackgroundHandle() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("onClickOnMessageBackgroundHandle : $message");
    });
  }
}