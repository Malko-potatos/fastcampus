import 'package:flutter/material.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommended')),
      body: const Center(child: Text('Recommended Webtoons')),
    );
  }
}
