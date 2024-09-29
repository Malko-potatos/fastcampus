import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestChallengeScreen extends StatelessWidget {
  final String? category;
  final String? extraValue;

  const BestChallengeScreen({super.key, this.category, this.extraValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Challenge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Best Challenge Webtoons'),
            if (category != null) Text('Category: $category'),
            if (extraValue != null) Text('Extra Value: $extraValue'),
            ElevatedButton(
              onPressed: () {
                context.go('/notfound');
              },
              child: const Text('Go to Route Error'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/restricted');
              },
              child: const Text('Go to Restrict'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/bestChallenge/admin');
              },
              child: const Text('Go to admin'),
            ),
          ],
        ),
      ),
    );
  }
}
