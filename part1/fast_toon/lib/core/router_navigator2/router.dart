// ignore_for_file: prefer_const_constructors

import 'package:fast_toon/features/common/presentation/pages/loungePage.dart';
import 'package:fast_toon/features/extra_service/presentation/pages/MoreScreen.dart';
import 'package:fast_toon/features/payment/presentation/pages/paymentScreen.dart';
import 'package:fast_toon/features/user/presentation/pages/myScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/BestChallengeScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/RecommendedScreen.dart';
import 'package:fast_toon/features/webtoon/presentation/pages/WebtoonScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final RouteInformationParser<AppRoutePath> _routeInformationParser = AppRouteInformationParser();
  final RouterDelegate<AppRoutePath> _routerDelegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigator 2.0 Example',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}



class AppRoutePath {
  final String? location;

  AppRoutePath({this.location});

  bool get isWebtoon => location == '/webtoon';
  bool get isRecommended => location == '/recommended';
  bool get isBestChallenge => location == '/bestChallenge';
  bool get isMy => location == '/my';
  bool get isMore => location == '/more';
  bool get isPayment => location == '/payment';
  bool get isLounge => location == '/lounge';
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return AppRoutePath(location: '/webtoon');
    }
    return AppRoutePath(location: '/${uri.pathSegments.first}');
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    return RouteInformation(uri: Uri.parse(configuration.location!));
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  String? _currentLocation = '/webtoon';

  @override
  AppRoutePath get currentConfiguration {
    return AppRoutePath(location: _currentLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentLocation == '/webtoon')
          MaterialPage(
            key: ValueKey('WebtoonScreen'),
            child: WebtoonScreen(),
          )
        else if (_currentLocation == '/recommended')
          MaterialPage(
            key: ValueKey('RecommendedScreen'),
            child: RecommendedScreen(),
          )
        else if (_currentLocation == '/bestChallenge')
          MaterialPage(
            key: ValueKey('BestChallengeScreen'),
            child: BestChallengeScreen(),
          )
        else if (_currentLocation == '/my')
          MaterialPage(
            key: ValueKey('MyScreen'),
            child: MyScreen(),
          )
        else if (_currentLocation == '/more')
          MaterialPage(
            key: ValueKey('MoreScreen'),
            child: MoreScreen(),
          )
        else if (_currentLocation == '/payment')
          MaterialPage(
            key: ValueKey('PaymentScreen'),
            child: PaymentScreen(),
          )
        else if (_currentLocation == '/lounge')
          MaterialPage(
            key: ValueKey('LoungeScreen'),
            child: LoungeScreen(),
          )
   
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _currentLocation = '/webtoon';
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _currentLocation = configuration.location;
    notifyListeners();
  }
}

