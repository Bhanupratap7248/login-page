import 'package:flutter/material.dart';
import 'package:f/pages/login.dart';
import 'package:f/pages/home.dart';
import 'package:f/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String? title;
  const MyApp({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 74, 9, 187),
        ),
      ),
      initialRoute: '/otp',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/signup': (context) => Signup(),
      },
    );
  }
}
