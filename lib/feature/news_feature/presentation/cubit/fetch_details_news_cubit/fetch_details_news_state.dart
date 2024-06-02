part of 'fetch_details_news_cubit.dart';

@immutable
abstract class FetchDetailsNewsState {}

class FetchDetailsNewsStateInitial extends FetchDetailsNewsState {}
class FetchDetailsNewsStateLoading extends FetchDetailsNewsState {}
class FetchDetailsNewsStateLoaded extends FetchDetailsNewsState {
  final ArticleEntity articleEntity;

  FetchDetailsNewsStateLoaded(this.articleEntity);
}
class FetchDetailsNewsStateError extends FetchDetailsNewsState {
  final String errorText;

  FetchDetailsNewsStateError(this.errorText);
}
