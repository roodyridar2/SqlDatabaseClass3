import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/auth/login_or_register.dart';
import 'package:sqlcheatcode/main.dart';
import 'package:sqlcheatcode/my_app.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyApp();
            } else {
              return const LoginOrRegister();
            }
          },
        ),
      ),
    );
  }
}
