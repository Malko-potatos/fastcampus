import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(initialLocation: '/webtoon', routes: [
      ShellRoute(routes: []),
    ]);
  },
);
