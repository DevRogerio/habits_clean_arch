import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:flutter/material.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habits App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(),
    );
  }
}
