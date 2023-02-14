import 'package:flutter/material.dart';
import 'package:medical_services/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Services',
      debugShowCheckedModeBanner: false,
      theme: lightTheme ,//! <-- change theme
      home: null,
    );
  }
}
