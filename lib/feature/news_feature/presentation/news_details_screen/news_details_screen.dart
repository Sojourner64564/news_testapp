import 'package:flutter/material.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_details_screen/news_details_page.dart';

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
