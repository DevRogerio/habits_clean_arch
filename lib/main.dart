import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:clean_arch_database/my_app_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}
