import 'package:fast_toon/features/common/presentation/providers/tabIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarScreen extends ConsumerWidget {
  final Widget child;

  const BottomNavigationBarScreen({required this.child, super.key});

  static const List<String> _tabs = [
    '/webtoon',
    '/recommended',
    '/bestChallenge',
    '/my',
    '/more',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          iconSize: 24,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.calendar_today),
              ),
              label: '웹툰',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.book),
              ),
              label: '추천완결',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.star),
              ),
              label: '베스트도전',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.person),
              ),
              label: 'MY',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.grid_view),
              ),
              label: '더보기',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            ref.read(tabIndexProvider.notifier).setIndex(index);
            context.go(_tabs[index]);
          },
        ),
      ),
    );
  }
}
