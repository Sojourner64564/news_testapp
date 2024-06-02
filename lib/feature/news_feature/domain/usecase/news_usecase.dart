import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/error/failure.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';
import 'package:news_testapp/feature/news_feature/domain/repository/news_repository.dart';

@lazySingleton
class NewsUsecase implements NewsRepository{
  NewsUsecase(this.newsRepository);

  final NewsRepository newsRepository;

  @override
  Future<Either<Failure, ArticleEntity>> fetchArticle(String id) async{
    return await newsRepository.fetchArticle(id);
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> fetchFeaturedArticles() async{
    return await newsRepository.fetchFeaturedArticles();

  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> fetchLatestArticles() async{
    return await newsRepository.fetchLatestArticles();

  }

}