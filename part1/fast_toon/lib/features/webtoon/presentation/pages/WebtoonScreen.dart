import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebtoonScreen extends StatelessWidget {
  const WebtoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Webtoon')),
      body: const Center(child: Text('Webtoon List')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '웹툰'),
          BottomNavigationBarItem(icon: Icon(Icons.recommend), label: '추천완결'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '베스트도전'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: '더보기'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/webtoon');
              break;
            case 1:
              context.go('/recommended');
              break;
            case 2:
              context.go('/bestChallenge');
              break;
            case 3:
              context.go('/my');
              break;
            case 4:
              context.go('/more');
              break;
          }
        },
      ),
    );
  }
}
