import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/error/failure.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';
import 'package:news_testapp/feature/news_feature/domain/usecase/news_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_featured_news_state.dart';

@lazySingleton
class FetchFeaturedNewsCubit extends Cubit<FetchFeaturedNewsState> {
  FetchFeaturedNewsCubit(this.newsUsecase) : super(FetchFeaturedNewsStateInitial());

  final NewsUsecase newsUsecase;

  Future<void> fetchFeaturedNews() async{
    emit(FetchFeaturedNewsStateLoading());
    final modelOrEither = await newsUsecase.fetchFeaturedArticles();
    final failureOrModel = modelOrEither.fold((l) => l, (r) => r);
    if(failureOrModel is InternetConnectionFailure){
      emit(FetchFeaturedNewsStateError('No Internet'));
      return;
    }
    if(failureOrModel is WebApiFailure){
      emit(FetchFeaturedNewsStateError('Service Error'));
      return;
    }
    failureOrModel as List<ArticleEntity>;
    if(failureOrModel.isEmpty){
      emit(FetchFeaturedNewsStateEmpty());
      return;
    }
    if(failureOrModel.isNotEmpty){
      emit(FetchFeaturedNewsStateLoaded(failureOrModel));
      return;
    }

  }
}
