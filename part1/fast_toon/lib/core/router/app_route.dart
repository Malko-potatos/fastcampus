import 'package:fast_toon/features/common/presentation/pages/admin.dart';
import 'package:fast_toon/features/user/presentation/providers/userProvider.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/WebtoonEpisodeListScreen%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fast_toon/features/common/presentation/pages/bottomNavigationPage.dart';
import 'package:fast_toon/features/common/presentation/pages/errorPage.dart';
import 'package:fast_toon/features/common/presentation/pages/loungePage.dart';
import 'package:fast_toon/features/extra_service/presentation/pages/MoreScreen.dart';
import 'package:fast_toon/features/payment/presentation/pages/paymentScreen.dart';
import 'package:fast_toon/features/user/presentation/pages/myScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/BestChallengeScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/EpisodeScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/RecommendedScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/WebtoonScreen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(userProvider);

  return GoRouter(
    initialLocation: '/webtoon',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationBarScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/webtoon',
                builder: (context, state) => const WebtoonScreen(),
                routes: [
                  GoRoute(
                    path: 'episodeList/:title/:author',
                    builder: (context, state) {
                      final title = state.pathParameters['title']!;
                      final author = state.pathParameters['author']!;
                      return WebtoonEpisodeListScreen(
                          title: title, author: author);
                    },
                    routes: [
                      GoRoute(
                        path: 'episode/:episodeId',
                        builder: (context, state) {
                          final episodeId = state.pathParameters['episodeId']!;
                          return EpisodeScreen(
                            id: episodeId,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/recommended',
                builder: (context, state) => const RecommendedScreen(),
                redirect: (context, state) {
                  // 무한 루프 생성
                  return '/redirect';
                },
              ),
              GoRoute(
                path: '/redirect',
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('Redirecting...'))),
                redirect: (context, state) {
                  // 다시 /recommended로 리디렉션
                  return '/recommended';
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/bestChallenge',
                builder: (context, state) => const BestChallengeScreen(),
                routes: [
                  GoRoute(
                    path: '/admin',
                    builder: (context, state) => const AdminScreen(),
                  ),
                ],
                redirect: (context, state) {
                  if (isUserAdmin()) {
                    throw ForbiddenException();
                  }
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my',
                builder: (context, state) => const MyScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                builder: (context, state) => const MoreScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: '/lounge',
        builder: (context, state) => const LoungeScreen(),
        redirect: (context, state) {
          return user.isPremiumMember ? null : '/payment';
        },
      ),
    ],
    errorBuilder: (context, state) => AdvancedErrorScreen(state: state),
    debugLogDiagnostics: true,
  );
});

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([this.message = '인증되지 않은 사용자입니다.']);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ForbiddenException implements Exception {
  final String message;

  ForbiddenException([this.message = '접근 권한이 없습니다.']);

  @override
  String toString() => 'ForbiddenException: $message';
}

bool isUserAuthorized() {
  // 인증 로직 구현
  return false;
}

bool isUserAdmin() {
  // 관리자 확인 로직 구현
  return false;
}
