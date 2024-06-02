import 'package:news_testapp/feature/news_feature/data/model/article_model.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';

extension ArticleModelToEntityExtension on ArticleModel{
  ArticleEntity toEntity(){
    final date = DateTime.parse(publicationDate);
    final difference = DateTime.now().difference(date);
    final daysAgo = difference.inDays.toString();
    return ArticleEntity(
      id:id,
      title:title,
      publicationDate:publicationDate,
      imageUrl:imageUrl,
      readed:readed,
      description:description,
      daysAgo:daysAgo,
    );
  }

}