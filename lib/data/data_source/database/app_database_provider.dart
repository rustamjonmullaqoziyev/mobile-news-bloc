import '../../../domain/modules/article.dart';

abstract class AppDatabaseProvider {
  Future<void> addFavoriteArticle(Article article);

  Future<void> removeFavoriteArticle(Article article);

  Future<List<Article>> getArticles();
}
