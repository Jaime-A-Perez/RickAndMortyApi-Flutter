import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){}, child: Text("button")),
              Text('Hello World'),
            ],
          ),
        ),
      ),
    );
  }
}