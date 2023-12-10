import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sqlcheatcode/components/button.dart';
import 'package:sqlcheatcode/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTaped});
  final Function()? onTaped;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  void signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      if (passwordTextEditingController.text.length < 8) {
        if (context.mounted) {
          Navigator.pop(context);
        }

        return;
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      // pop dialog
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // pop dialog
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 24, 25),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Icon(
                Icons.lock_outline_rounded,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Please login to continue ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),

            const SizedBox(
              width: double.infinity,
              child: Text(
                "Email: ",
                style: TextStyle(
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 6),
            // email textfield
            MyTextField(
              controller: emailTextEditingController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10),

            const SizedBox(
              width: double.infinity,
              child: Text(
                "Password: ",
                style: TextStyle(
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 6),
            // password textfield
            MyTextField(
              controller: passwordTextEditingController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // sign in button
            MyButton(text: "Sign in", onTaped: signIn),
            const SizedBox(height: 10),

            // go to register page

            TextButton(
              onPressed: widget.onTaped,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not registered yet? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
