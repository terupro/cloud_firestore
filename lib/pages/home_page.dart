import 'package:cloud_firestore_app/models/user.dart';
import 'package:cloud_firestore_app/pages/user_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ),
          ),
        ),
      ),
    );
  }
}
