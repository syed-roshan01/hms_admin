import 'package:flutter/material.dart';

class DriverCollectionScreen extends StatelessWidget {
  const DriverCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Collection')),
      body: const Center(child: Text('Driver Collection Details Here')),
    );
  }
}
