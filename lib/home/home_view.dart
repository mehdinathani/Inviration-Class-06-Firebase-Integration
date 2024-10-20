import 'package:class06/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future addTasks() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .collection('Tasks')
        .doc()
        .set({
          'title': titleController.text,
          'description': descriptionController.text,
          'creater': uid,
          'time': FieldValue.serverTimestamp(),
        })
        .then((value) => print("task Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
          child: Column(
        children: [
          CustomTextField(hintText: "Task", controller: titleController),
          CustomTextField(
              hintText: "Description", controller: descriptionController),
          ElevatedButton(
              onPressed: () async {
                await addTasks();
              },
              child: const Text("Add Task")),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text("Sign Out")),
        ],
      )),
    );
  }
}
