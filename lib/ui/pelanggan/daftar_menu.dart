import 'package:flutter/material.dart';

class DaftarMenu extends StatelessWidget {
  const DaftarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
      ),
      body: const Center(
        child: Text('This is the Menu Page'),
      ),
    );
  }
}
