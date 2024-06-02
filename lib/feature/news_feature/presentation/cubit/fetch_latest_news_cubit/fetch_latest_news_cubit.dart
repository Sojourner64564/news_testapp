import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/error/failure.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';
import 'package:news_testapp/feature/news_feature/domain/usecase/news_usecase.dart';

part 'fetch_latest_news_state.dart';

@lazySingleton
class FetchLatestNewsCubit extends Cubit<FetchLatestNewsState> {
  FetchLatestNewsCubit(this.newsUsecase) : super(FetchLatestNewsStateInitial());
  final NewsUsecase newsUsecase;

  Future<void> fetchLatestNews() async{
    emit(FetchLatestNewsStateLoading());
    final modelOrEither = await newsUsecase.fetchLatestArticles();
    final failureOrModel = modelOrEither.fold((l) => l, (r) => r);
    if(failureOrModel is InternetConnectionFailure){
      emit(FetchLatestNewsStateError('No Internet'));
      return;
    }
    if(failureOrModel is WebApiFailure){
      emit(FetchLatestNewsStateError('Service Error'));
      return;
    }
    failureOrModel as List<ArticleEntity>;
    if(failureOrModel.isEmpty){
      emit(FetchLatestNewsStateEmpty());
      return;
    }
    if(failureOrModel.isNotEmpty){
      emit(FetchLatestNewsStateLoaded(failureOrModel));
      return;
    }

  }
}
