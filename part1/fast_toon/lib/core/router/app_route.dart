import 'package:fast_toon/features/common/presentation/pages/errorPage.dart';
import 'package:fast_toon/features/common/presentation/pages/loungePage.dart';
import 'package:fast_toon/features/extra_service/presentation/pages/MoreScreen.dart';
import 'package:fast_toon/features/payment/presentation/pages/paymentScreen.dart';
import 'package:fast_toon/features/user/presentation/pages/myScreen.dart';
import 'package:fast_toon/features/user/presentation/providers/userProvider.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/BestChallengeScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/EpisodeScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/RecommendedScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/WebtoonByDayScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/WebtoonScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/webtoon',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/webtoon',
      ),
      GoRoute(
        path: '/webtoon',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const WebtoonScreen(),
        ),
        routes: [
          GoRoute(
            path: 'day/:day',
            pageBuilder: (context, state) {
              final day = state.pathParameters['day']!;
              return MaterialPage(
                key: state.pageKey,
                child: WebtoonByDayScreen(day: day),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/recommended',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RecommendedScreen(),
        ),
      ),
      GoRoute(
        path: '/bestChallenge',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const BestChallengeScreen(),
        ),
      ),
      GoRoute(
        path: '/my',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MyScreen(),
        ),
      ),
      GoRoute(
        path: '/more',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MoreScreen(),
        ),
      ),
      GoRoute(
        path: '/episode/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(
            key: state.pageKey,
            child: EpisodeScreen(id: id),
          );
        },
      ),
      GoRoute(
        path: '/payment',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const PaymentScreen(),
        ),
      ),
      GoRoute(
        path: '/lounge',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoungeScreen(),
        ),
        redirect: (context, state) {
          final isPremiumMember = ref.read(userProvider).isPremiumMember;
          return isPremiumMember ? null : '/payment';
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
