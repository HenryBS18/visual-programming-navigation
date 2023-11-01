import 'package:flutter/material.dart';
import 'third_sub_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdSubScreen()));
          },
          child: const Text('Go Back to Third Sub Screen'),
        ),
      ),
    );
  }
}
