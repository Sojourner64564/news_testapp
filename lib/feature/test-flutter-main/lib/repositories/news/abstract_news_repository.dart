import 'package:news_testapp/feature/test-flutter-main/lib/repositories/news/models/article_test.dart';

abstract class AbstractNewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
}
