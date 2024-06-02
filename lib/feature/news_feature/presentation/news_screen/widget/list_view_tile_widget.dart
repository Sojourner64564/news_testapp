import 'package:flutter/material.dart';
import 'package:news_testapp/core/my_colors/my_colors.dart';
import 'package:news_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';

class ListViewTileWidget extends StatelessWidget {
  const ListViewTileWidget({super.key, required this.articleEntity});
  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 23, 20, 23),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(articleEntity.imageUrl),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 220,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleEntity.title,
                    style: MyTextStyles.text1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    articleEntity.publicationDate,
                    style: MyTextStyles.greyText2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
