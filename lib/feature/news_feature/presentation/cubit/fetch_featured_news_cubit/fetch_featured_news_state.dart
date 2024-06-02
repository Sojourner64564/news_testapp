part of 'fetch_featured_news_cubit.dart';

@immutable
abstract class FetchFeaturedNewsState {}

class FetchFeaturedNewsStateInitial extends FetchFeaturedNewsState {}
class FetchFeaturedNewsStateLoading extends FetchFeaturedNewsState {}
class FetchFeaturedNewsStateError extends FetchFeaturedNewsState {
  final String errorText;

  FetchFeaturedNewsStateError(this.errorText);
}
class FetchFeaturedNewsStateLoaded extends FetchFeaturedNewsState {
  final List<ArticleEntity> listArticle;

  FetchFeaturedNewsStateLoaded(this.listArticle);
}
class FetchFeaturedNewsStateEmpty extends FetchFeaturedNewsState {}
