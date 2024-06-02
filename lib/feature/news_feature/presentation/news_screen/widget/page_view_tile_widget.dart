import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';

class PageViewTileWidget extends StatelessWidget {
  const PageViewTileWidget({super.key, required this.articleEntity});
  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 40,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width-40,
                child: Text(
                  articleEntity.title,
                  style: MyTextStyles.title3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )),
          ),
           ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(articleEntity.imageUrl),
          ),
        ],
      ),
    );
  }
}
