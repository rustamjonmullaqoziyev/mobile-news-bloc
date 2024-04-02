import 'package:mobile_news_with_bloc/domain/modules/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getBreakingArticle();

  Future<List<Article>> getTopStoreArticle();

  Future<List<Article>> getRecommendedArticle();

  Future<List<Article>> getReadLaterArticle();

  Future<void> addFavoriteArticle(Article article);

  Future<void> removeFavoriteArticle(Article article);
}
