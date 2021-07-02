import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificaciones {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugins =
      new FlutterLocalNotificationsPlugin();

  init() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("low");
    //TODO: ios config

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    this.flutterLocalNotificationPlugins.initialize(initializationSettings);
  }

  Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            "your channel", " channel name", "channel description",
            priority: Priority.max, importance: Importance.max);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationPlugins.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
    );
  }
}
