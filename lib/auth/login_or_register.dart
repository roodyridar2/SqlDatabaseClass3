import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/post/login_pages.dart';
import 'package:sqlcheatcode/pages/post/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initial show the login page
  bool showLoginPage = true;
  // toggle between login and register page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showLoginPage
        ? LoginPage(onTaped: togglePage)
        : RegisterPage(onTaped: togglePage));
  }
}
