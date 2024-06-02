import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/error/failure.dart';
import 'package:news_testapp/feature/news_feature/domain/entity/article_entity.dart';

import '../../../domain/usecase/news_usecase.dart';

part 'fetch_details_news_state.dart';

@lazySingleton
class FetchDetailsNewsCubit extends Cubit<FetchDetailsNewsState> {
  FetchDetailsNewsCubit(this.newsUsecase) : super(FetchDetailsNewsStateInitial());
  final NewsUsecase newsUsecase;

  Future<void> fetchDetailsNews(String id) async{
    emit(FetchDetailsNewsStateLoading());
    final modelOrEither = await newsUsecase.fetchArticle(id);
    final failureOrModel = modelOrEither.fold((l) => l, (r) => r);
    if(failureOrModel is InternetConnectionFailure){
      emit(FetchDetailsNewsStateError('No Internet'));
      return;
    }
    if(failureOrModel is WebApiFailure){
      emit(FetchDetailsNewsStateError('Service Error'));
      return;
    }
    failureOrModel as ArticleEntity;

    emit(FetchDetailsNewsStateLoaded(failureOrModel));


  }
}
