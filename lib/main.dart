import 'package:flutter/material.dart';
import 'package:news_testapp/core/injectable/injectable.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_screen/news_screen.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsScreen(),
    );
  }
}


