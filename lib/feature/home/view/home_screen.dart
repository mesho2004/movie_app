import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Home')),
      body: const Center(
        child: Text(
          'Home content here',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
