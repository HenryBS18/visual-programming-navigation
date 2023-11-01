import 'package:flutter/material.dart';

class ThirdSubScreen extends StatelessWidget {
  const ThirdSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Sub Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back to Third Screen'),
        ),
      ),
    );
  }
}
