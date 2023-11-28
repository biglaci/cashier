import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        elevation: 0, // for background transparent
        title: const Text("Settings"),
        foregroundColor: Colors.grey[100],
        backgroundColor: Colors.green[900],
        actions: const [],
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 50.0,

          ),
        ],
      ),
    );
  }
}
