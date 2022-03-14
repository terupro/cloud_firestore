import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore_app/models/user.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // TextFieldに入力された内容
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerName,
            decoration: InputDecoration(hintText: "Name"),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerAge,
            decoration: InputDecoration(hintText: "Age"),
          ),
          const SizedBox(height: 24),
          DateTimeField(
            controller: controllerDate,
            decoration: InputDecoration(hintText: "Birthday"),
            format: DateFormat('yyyy-MM-dd'),
            keyboardType: TextInputType.datetime,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                initialDate: currentValue ?? DateTime.now(),
              );
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 45.0,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // 保管するデータの確定
                  final user = User(
                    name: controllerName.text,
                    age: int.parse(controllerAge.text),
                    birthday: DateTime.parse(controllerDate.text),
                  );
                  //
                  createUser(user);
                },
                child: const Text(
                  "Create",
                  style: TextStyle(fontSize: 20.0),
                )),
          ),
        ],
      ),
    );
  }
}

//
Future createUser(User user) async {
  // データを保管する場所の指定
  final docUser = FirebaseFirestore.instance.collection("users").doc();
  // idの指定
  user.id = docUser.id;
  // データのJSON化
  final json = user.toJson();
  // データを送る
  await docUser.set(json);
}
