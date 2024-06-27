import 'package:flutter/material.dart';

class WebtoonByDayScreen extends StatelessWidget {
  final String day;

  const WebtoonByDayScreen({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$day Webtoon')),
      body: Center(child: Text('Webtoon List for $day')),
    );
  }
}
