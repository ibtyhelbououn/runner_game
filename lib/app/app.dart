import 'package:flutter/material.dart';

class RunnerApp extends StatelessWidget {
  const RunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strawberry Sprint',
      home: const Scaffold(
        body: Center(
          child: Text('Strawberry Sprint'),
        ),
      ),
    );
  }
}