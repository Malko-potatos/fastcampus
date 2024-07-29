import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// RecommendedScreen
class RecommendedScreen extends ConsumerWidget {
  const RecommendedScreen({super.key});

  void goToLounge(BuildContext context) {
    context.go('/lounge');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended'),
        actions: [
          IconButton(
            icon: const Icon(Icons.door_back_door),
            onPressed: () {
              goToLounge(context);
            },
          ),
        ],
      ),
      body: const Center(child: Text('Recommended Webtoons')),
    );
  }
}
