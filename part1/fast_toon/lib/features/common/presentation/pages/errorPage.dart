import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'An error occurred',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Something went wrong. Please try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.go('/webtoon');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
