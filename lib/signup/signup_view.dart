import 'dart:developer';

import 'package:class06/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> addUser() {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .set({
          'email': emailController.text,
          'uid': uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future emailSignup() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      )
          .then(
        (value) async {
          (value) => log("Login");
          await addUser();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup View"),
      ),
      body: Column(
        children: [
          CustomTextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            hintText: "Email",
          ),
          CustomTextField(
            controller: passwordController,
            hintText: "password",
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () async {
                await emailSignup();
              },
              child: const Text("Register"))
        ],
      ),
    );
  }
}
