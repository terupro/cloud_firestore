import 'package:cloud_firestore_app/models/user.dart';
import 'package:cloud_firestore_app/pages/home_page.dart';
import 'package:cloud_firestore_app/pages/user_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud FireStore',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            // 角丸
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}



