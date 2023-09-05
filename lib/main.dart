import 'package:chat_app_af_12/Screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/login_screen_custom.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      routes: {
        '/': (context) => Login_Screen(),
        'home': (context) => Home_Screen(),
        'chat': (context) => Chat_Screen(),
      },
    ),
  );
}
