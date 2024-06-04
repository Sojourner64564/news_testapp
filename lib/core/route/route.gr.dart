// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:news_testapp/feature/news_feature/presentation/news_details_screen/news_details_screen.dart'
    as _i1;
import 'package:news_testapp/feature/news_feature/presentation/news_screen/news_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    NewsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.NewsDetailsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      final args =
          routeData.argsAs<NewsRouteArgs>(orElse: () => const NewsRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.NewsScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.NewsDetailsScreen]
class NewsDetailsRoute extends _i3.PageRouteInfo<NewsDetailsRouteArgs> {
  NewsDetailsRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          NewsDetailsRoute.name,
          args: NewsDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailsRoute';

  static const _i3.PageInfo<NewsDetailsRouteArgs> page =
      _i3.PageInfo<NewsDetailsRouteArgs>(name);
}

class NewsDetailsRouteArgs {
  const NewsDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'NewsDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.NewsScreen]
class NewsRoute extends _i3.PageRouteInfo<NewsRouteArgs> {
  NewsRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          NewsRoute.name,
          args: NewsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i3.PageInfo<NewsRouteArgs> page =
      _i3.PageInfo<NewsRouteArgs>(name);
}

class NewsRouteArgs {
  const NewsRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key}';
  }
}
