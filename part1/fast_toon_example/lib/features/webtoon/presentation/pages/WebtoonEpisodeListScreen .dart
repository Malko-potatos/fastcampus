// webtoon_episode_list.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebtoonEpisodeListScreen extends StatelessWidget {
  final String title;
  final String author;

  const WebtoonEpisodeListScreen({
    Key? key,
    required this.title,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 에피소드 데이터 생성
    final List<Map<String, String>> episodes = List.generate(
      20,
      (index) => {
        'episodeNumber': '${index + 1}',
        'title': '에피소드 ${index + 1}',
        'uploadDate': '2023-07-${index + 1}',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [         
          Expanded(
            child: ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                final episode = episodes[index];
                return ListTile(
                  title: Text(episode['title']!),
                  subtitle: Text('업로드: ${episode['uploadDate']}'),
                  trailing: Text('# ${episode['episodeNumber']}'),
                  onTap: () {
                  context.go('/webtoon/episodeList/$title/$author/episode/${episode['episodeNumber']}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}