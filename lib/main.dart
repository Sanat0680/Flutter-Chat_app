//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Chat.dart';
import 'Home.dart';
import 'Login.dart';
import 'Reg.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(theme: ThemeData.light(), initialRoute: "/", routes: {
      "/": (context) => Home(),
      "/reg": (context) => Reg(),
      "/login": (context) => Login(),
      "/chat": (context) => Chat(),
    }),
  );
}
