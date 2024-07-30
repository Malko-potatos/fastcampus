import 'package:flutter/material.dart';

class EpisodeScreen extends StatelessWidget {
  final String id;

  const EpisodeScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episode $id')),
      body: ListView.builder(
        itemCount: 15,  // 한 회차당 15개의 이미지
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.network(
                'https://via.placeholder.com/400x600',  // 플레이스홀더 이미지
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black54,
                child: Text(
                  '${index + 1}',  // 인덱스 번호 (1부터 시작)
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}