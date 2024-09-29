import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebtoonByDayScreen extends StatelessWidget {
  final String day;
  const WebtoonByDayScreen({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    // 임시 웹툰 데이터 생성
    final List<Map<String, String>> webtoons = List.generate(
      20,
      (index) => {
        'title': '웹툰 ${index + 1}',
        'author': '작가 ${index + 1}',
        'imageUrl': 'https://via.placeholder.com/300x400', // 더 큰 이미지 사용
      },
    );

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 행에 3개의 아이템
          childAspectRatio: 0.7, // 세로로 더 길게
          crossAxisSpacing: 8, // 가로 간격
          mainAxisSpacing: 8, // 세로 간격
        ),
        itemCount: webtoons.length,
        itemBuilder: (context, index) {
          final webtoon = webtoons[index];
          return GestureDetector(
            onTap: () {
              context.go('/webtoon/episodeList/${webtoon['title']}/${webtoon['author']}');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    webtoon['imageUrl']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    webtoon['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  webtoon['author']!,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}