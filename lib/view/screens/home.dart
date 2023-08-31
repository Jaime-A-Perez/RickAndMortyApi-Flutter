import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(        
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        bottomNavigationBar: Text('Hello World'),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){}, child: Text("button")),
              Text('Hello World'),
            ],
          ),
        ),
      );
  }
}