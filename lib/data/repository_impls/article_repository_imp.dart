import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/data/data_souce/service/article_service.dart';
import 'package:mobile_news_with_bloc/data/data_souce/storage/article_storage.dart';
import 'package:mobile_news_with_bloc/data/mapper/article.dart';
import 'package:mobile_news_with_bloc/data/responses/article/article_list_response.dart';
import 'package:mobile_news_with_bloc/domain/modules/article.dart';
import 'package:mobile_news_with_bloc/domain/repositories/article_repository.dart';

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl(this._articleService, this.articleStorageProvider);

  final ArticleService _articleService;
  final ArticleStorageProvider articleStorageProvider;

  @override
  Future<List<Article>> getBreakingArticle() async {
    final response = await _articleService.getArticle(
        country: "us", category: "science", sortBy: "popularity");
    final articles = ArticleListResponse.fromJson(response.data)
        .articles
        .map((article) => article.toArticle())
        .toList();
    return articles;
  }

  @override
  Future<List<Article>> getTopStoreArticle() async {
    final response = await _articleService.getArticle(
        country: "us", category: "general", sortBy: "popularity");
    final articles = ArticleListResponse.fromJson(response.data)
        .articles
        .map((article) => article.toArticle())
        .toList();
    return articles;
  }

  @override
  Future<List<Article>> getRecommendedArticle() async {
    final response = await _articleService.getArticle(
        country: "us", category: "science", sortBy: "popularity");
    final articles = ArticleListResponse.fromJson(response.data)
        .articles
        .map((article) => article.toArticle())
        .toList();
    return articles;
  }

  @override
  Future<List<Article>> getReadLaterArticle() async {
    final response = await _articleService.getArticle(
        country: "us", category: "science", sortBy: "popularity");
    final articles = ArticleListResponse.fromJson(response.data)
        .articles
        .map((article) => article.toArticle())
        .toList();
    return articles;
  }
}
