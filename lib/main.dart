import 'package:flutter/material.dart';
import 'package:news_testapp/core/injectable/injectable.dart';
import 'package:news_testapp/core/route/route.dart';

void main() {
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}


