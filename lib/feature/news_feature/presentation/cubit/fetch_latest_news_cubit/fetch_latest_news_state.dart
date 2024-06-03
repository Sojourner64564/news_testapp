part of 'fetch_latest_news_cubit.dart';

@immutable
abstract class FetchLatestNewsState {}

class FetchLatestNewsStateInitial extends FetchLatestNewsState {}
class FetchLatestNewsStateLoading extends FetchLatestNewsState {}
class FetchLatestNewsStateError extends FetchLatestNewsState {
  FetchLatestNewsStateError(this.errorText);
  final String errorText;
}
class FetchLatestNewsStateLoaded extends FetchLatestNewsState {
  FetchLatestNewsStateLoaded(this.listArticle, this.color);
  final List<ArticleEntity> listArticle;
  final Color color;
}
class FetchLatestNewsStateEmpty extends FetchLatestNewsState {}
