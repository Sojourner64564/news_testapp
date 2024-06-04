import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/route/route.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: NewsRoute.page,
      initial: true,
    ),
    AutoRoute(page: NewsDetailsRoute.page),
  ];
}
