import 'package:dartz/dartz.dart';
import 'package:news_testapp/core/error/failure.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';

abstract class NewsRepository{
  Future<Either<Failure, List<ArticleEntity>>> fetchLatestArticles();
  Future<Either<Failure, List<ArticleEntity>>> fetchFeaturedArticles();
  Future<Either<Failure,ArticleEntity>> fetchArticle(String id);
}
