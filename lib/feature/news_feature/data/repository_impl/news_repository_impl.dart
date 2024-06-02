import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/error/failure.dart';
import 'package:news_testapp/core/network/network_info.dart';
import 'package:news_testapp/feature/news_feature/data/data_source/remote_data_source/news_remote_data_source.dart';
import 'package:news_testapp/feature/news_feature/data/model/extension/extension_article_model_to_entity.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';
import 'package:news_testapp/feature/news_feature/domain/repository/news_repository.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRepositoryImpl(this.newsRemoteDataSource, this.networkInfo);
  final NetworkInfo networkInfo;
  final NewsRemoteDataSource newsRemoteDataSource;
  
  @override
  Future<Either<Failure, ArticleEntity>> fetchArticle(String id) async{
    if(! await networkInfo.isConnected) return Left(InternetConnectionFailure());
    try{
      final model = await newsRemoteDataSource.fetchArticle(id);
      final entity = model.toEntity();
      return Right(entity);
    }catch(e){
      return Left(WebApiFailure());
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> fetchFeaturedArticles() async{
    if(! await networkInfo.isConnected) return Left(InternetConnectionFailure());
    try{
      final model = await newsRemoteDataSource.fetchFeaturedArticles();
      final entity = model.map((e) => e.toEntity()).toList();
      return Right(entity);
    }catch(e){
      return Left(WebApiFailure());
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> fetchLatestArticles() async{
    if(! await networkInfo.isConnected) return Left(InternetConnectionFailure());
    try{
      final model = await newsRemoteDataSource.fetchLatestArticles();
      final entity = model.map((e) => e.toEntity()).toList();
      return Right(entity);
    }catch(e){
      return Left(WebApiFailure());
    }
  }

}