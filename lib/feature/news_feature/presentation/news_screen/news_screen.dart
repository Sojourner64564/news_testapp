import 'package:flutter/material.dart';
import 'package:news_testapp/core/injectable/injectable.dart';
import 'package:news_testapp/core/my_colors/my_colors.dart';
import 'package:news_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:news_testapp/feature/news_feature/presentation/controller/change_mark_in_latest_controller.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_screen/news_page.dart';

class NewsScreen extends StatelessWidget{
  NewsScreen({super.key});
  final changeMarkInLatestController = getIt<ChangeMarkInLatestController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        toolbarHeight: 120,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios,
          ),
          onPressed: () {

          },
        ),
        title: const Text(
          'Notification',
          style: MyTextStyles.title1,
        ),
        centerTitle: true,
        actions: [
          Material(
            child: Ink(
              child: InkWell(
                splashColor: Colors.red,
                onTap: (){
                  changeMarkInLatestController.markAllRead();
                },
                child: const Text(
                  'Mark all read',
                  style: MyTextStyles.title1,
                ),
                ),
              ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const NewsPage(),
    );
  }

}