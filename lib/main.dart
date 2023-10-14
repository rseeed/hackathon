import 'package:flutter/material.dart';
import 'package:hackathon/pages/main_screen.dart';
import 'package:hackathon/pages/registration.dart';
import 'package:hackathon/pages/recoveryPass.dart';
import 'package:hackathon/pages/profile.dart';
import 'package:hackathon/pages/firstScreen.dart';


void main() =>  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.cyan,
  ),
  initialRoute: '/firstScreen',
  routes: {
    '/main': (context)  => MainScreen(),
    '/registration': (context) => Registration(),
    '/recovery': (context) => RecoveryPass(),
    '/profile': (context) => Profile(),
    '/firstScreen': (context) => firstScreen(),
  },
));


