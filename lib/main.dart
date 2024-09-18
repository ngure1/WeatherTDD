import 'package:flutter/material.dart';
import 'package:weather_tdd/core/constants/constants.dart';

void main() {
  Urls.loadEnv();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
