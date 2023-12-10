import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sqlcheatcode/components/button.dart';
import 'package:sqlcheatcode/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.onTaped});
  final Function()? onTaped;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();
    final confirmPasswordTextEditingController = TextEditingController();

    void signUp() async {
      showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      try {
        if (passwordTextEditingController.text !=
            confirmPasswordTextEditingController.text) {
          if (context.mounted) {
            Navigator.pop(context);
          }

          return;
        }
        if (passwordTextEditingController.text.length < 8) {
          if (context.mounted) {
            Navigator.pop(context);
          }

          return;
        }

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 24, 25),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Register account to continue ",
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
                      fontWeight: FontWeight.bold),
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
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Confirm Password: ",
                  style: TextStyle(
                      // fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 6),

              MyTextField(
                controller: confirmPasswordTextEditingController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // sign in button
              MyButton(text: "Sign up", onTaped: signUp),
              const SizedBox(height: 10),

              // go to register page

              TextButton(
                onPressed: widget.onTaped,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account! ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "login in",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
