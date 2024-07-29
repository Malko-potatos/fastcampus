import 'package:fast_toon/features/user/presentation/providers/userProvider.dart';
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

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.read(userProvider);

  return GoRouter(
    initialLocation: '/webtoon',
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return BottomNavigationBarScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/webtoon',
            builder: (context, state) => const WebtoonScreen(),
          ),
          GoRoute(
            path: '/recommended',
            builder: (context, state) => const RecommendedScreen(),
          ),
          GoRoute(
            path: '/bestChallenge/:category',
            builder: (context, state) {
              final category = state.pathParameters['category'];
              final extraValue = state.extra as String?;
              return BestChallengeScreen(
                  category: category, extraValue: extraValue);
            },
            redirect: (context, state) {
              if (!user.isPremiumMember) {
                return '/payment';
              }
              return null;
            },
          ),
          GoRoute(
            path: '/my',
            builder: (context, state) => const MyScreen(),
          ),
          GoRoute(
            path: '/more',
            builder: (context, state) => const MoreScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/episode/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EpisodeScreen(id: id);
        },
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: '/lounge',
        builder: (context, state) => const LoungeScreen(),
        redirect: (context, state) {
          final user = ref.read(userProvider);
          return user.isPremiumMember ? null : '/payment';
        },
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    debugLogDiagnostics: true,
  );
});
