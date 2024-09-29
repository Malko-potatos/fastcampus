import 'package:fast_toon/features/common/presentation/providers/tabIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationBarScreen({required this.navigationShell, super.key});

  static const List<String> tabs = [
    '/webtoon',
    '/recommended',
    '/bestChallenge',
    '/my',
    '/more',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        if (navigationShell.currentIndex != 0) {
          // If not on the first tab, switch to the first tab
          navigationShell.goBranch(0);
          ref.read(tabIndexProvider.notifier).setIndex(0);
        } else {
          // If on the first tab, check if we can pop the current route
          final navigator = navigationShell.shellRouteContext.navigatorKey.currentState;
          if (navigator == null) return;
          
          if (await navigator.maybePop()) {
            // We popped a route in the first tab
          } else {
            // Nothing to pop in the first tab, ask to exit the app
            if (context.mounted) {
              final shouldExit = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('앱 종료'),
                  content: const Text('앱을 종료하시겠습니까?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('취소'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('종료'),
                    ),
                  ],
                ),
              );
              if (shouldExit ?? false) {
                // Exit the app
                navigator.pop();
              }
            }
          }
        }
      },
      child: Scaffold(
        body: navigationShell,
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
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(index);
              ref.read(tabIndexProvider.notifier).setIndex(index);
            },
          ),
        ),
      ),
    );
  }
}