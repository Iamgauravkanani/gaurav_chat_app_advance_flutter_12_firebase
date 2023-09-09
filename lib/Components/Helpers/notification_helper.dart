import 'dart:developer';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notification_Helper {
  Notification_Helper._();

  static final Notification_Helper notification_helper =
      Notification_Helper._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initNotification() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOs = DarwinInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(
      initSetttings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        log("===========================================================================");
        log("===========================================================================");
        log("${notificationResponse.payload}");
        log("${notificationResponse.notificationResponseType}");
        log("===========================================================================");
        log("===========================================================================");
      },
    );
  }

  Future<void> SimpleNotification() async {
    var android = const AndroidNotificationDetails('id', 'channel ',
        channelDescription: 'description',
        priority: Priority.high,
        importance: Importance.max);
    var iOS = const DarwinNotificationDetails();
    var platform = new NotificationDetails(iOS: iOS, android: android);
    await flutterLocalNotificationsPlugin.show(
        0, 'Flutter Chat App', 'Message From Mathakhut.....', platform,
        payload: 'Welcome to the Local Notification demo');
  }

  Future<void> ScheduledNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel id',
      'channel name',
      channelDescription: 'channel description',
      icon: 'mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Flutter Chat App',
        'Message From Vavajodu..............',
        tz.TZDateTime.now(tz.UTC).add(Duration(seconds: 5)),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: "Ha ha bhai chale chw maja karo .....");
  }
}