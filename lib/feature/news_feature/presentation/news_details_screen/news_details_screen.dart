import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_details_screen/news_details_page.dart';

@RoutePage()
class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsDetailsPage(id: id),
    );
  }
}
