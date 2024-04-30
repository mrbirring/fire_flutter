import 'package:fire_flutter/Home.dart';
import 'package:fire_flutter/admin/Login.dart';
import 'package:fire_flutter/firebase_options.dart';
import 'package:fire_flutter/sacreen/first_head.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Loginpage(),
      ),
    );
  }
}
