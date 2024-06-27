import 'package:flutter/material.dart';

class EpisodeScreen extends StatelessWidget {
  final String id;

  const EpisodeScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episode $id')),
      body: Center(child: Text('Episode Content for $id')),
    );
  }
}
