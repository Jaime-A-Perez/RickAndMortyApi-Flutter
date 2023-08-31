import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/theme/app_theme.dart';
import 'package:rick_and_morty/view/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home()
    );
  }
}