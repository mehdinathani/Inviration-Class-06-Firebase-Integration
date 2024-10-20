import 'package:class06/custom_text_field.dart';
import 'package:class06/signup/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future loginWithEmail() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login View"),
      ),
      body: Column(
        children: [
          CustomTextField(
            controller: emailController,
            hintText: "Email",
          ),
          CustomTextField(
            controller: passwordController,
            hintText: "password",
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () async {
                await loginWithEmail();
              },
              child: const Text("Login")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupView(),
                    ));
              },
              child: const Text("Register Here"))
        ],
      ),
    );
  }
}
