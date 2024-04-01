import '../../../domain/modules/article.dart';

abstract class AppDatabaseProvider {
  Future<void> insertArticle(Article article);

  // Future<void> updateArticle(Article article);
  //
  // Future<void> deleteArticle(Article article);

  Future<List<Article>> getArticles();

// Future<Article> getArticleById(int id);

// Future<void> deleteAllArticles();

// Future<void> insertAllArticles(List<Article> articles);
//
// Future<void> updateAllArticles(List<Article> articles);
}
