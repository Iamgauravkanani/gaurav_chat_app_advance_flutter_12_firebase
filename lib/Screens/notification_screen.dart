import 'package:chat_app_af_12/Components/Helpers/notification_helper.dart';
import 'package:flutter/material.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({super.key});

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Notification_Helper.notification_helper.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Notification_Helper.notification_helper.SimpleNotification();
                },
                child: Text("Simple Notification")),
            ElevatedButton(
                onPressed: () {
                  Notification_Helper.notification_helper
                      .ScheduledNotification();
                },
                child: Text("Scheduled Notification")),
            ElevatedButton(
                onPressed: () {}, child: Text("Media Style Notification")),
            ElevatedButton(
                onPressed: () {}, child: Text("Big Avatar Notification")),
          ],
        ),
      ),
    );
  }
}
