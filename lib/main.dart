import 'package:flutter/material.dart';
import 'package:f/pages/login.dart';
//import 'package:f/pages/home.dart';

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
      title: 'login',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 74, 9, 187),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        // '/home': (context) => Home(),
      },
    );
  }
}
