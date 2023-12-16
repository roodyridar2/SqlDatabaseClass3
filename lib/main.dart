import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/auth/auth.dart';
import 'package:sqlcheatcode/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox("myTimer");
  await Hive.openBox("myRecord");
  await Hive.openBox("rateLimit");
  // await Hive.openBox("userQuestion");

  runApp(
    const ProviderScope(child: AuthPage()),
  );
}
