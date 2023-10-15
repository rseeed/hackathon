import 'package:flutter/material.dart';
import 'package:hackathon/pages/main_screen.dart';
import 'package:hackathon/pages/registration.dart';
import 'package:hackathon/pages/profile.dart';
import 'package:hackathon/pages/firstScreen.dart';
import 'package:hackathon/pages/chat.dart';
import 'package:hackathon/pages/Helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/firstScreen',
  routes: {
    '/firstScreen': (context) => firstScreen(),
    '/registration': (context) => Registration(),
    '/main': (context)  => MainScreen(),
    '/profile': (context) => Profile(),
    '/helper': (context) => Helper(),
    '/chat': (context) => ChatApp(),
  },
));
