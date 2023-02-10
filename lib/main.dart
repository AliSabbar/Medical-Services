import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DeleteThisClass(),
    );
  }
}

//! Delete The Class



class DeleteThisClass extends StatelessWidget {
  const DeleteThisClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
