import 'package:flutter/material.dart';

import 'Views/HomePage.dart';

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'Weather Buddy';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  HomePage(
        title: title,

      ),
    );
  }
}

