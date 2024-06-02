import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_testapp/core/my_colors/my_colors.dart';
import 'package:news_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';

class PageViewTileWidget extends StatelessWidget {
  const PageViewTileWidget({super.key, required this.articleEntity});
  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              articleEntity.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: MyColors.transparentBlackColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  articleEntity.title,
                  style: MyTextStyles.whiteTitle3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )),
          ),
        ],
      ),
    );
  }
}
