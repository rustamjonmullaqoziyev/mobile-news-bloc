import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/extensions/article_extensions.dart';
import 'package:mobile_news_with_bloc/data/constants/rest_query_keys.dart';
import 'package:mobile_news_with_bloc/data/data_source/service/article_service.dart';
import 'package:mobile_news_with_bloc/data/mapper/article.dart';
import 'package:mobile_news_with_bloc/data/responses/article/article_list_response.dart';
import 'package:mobile_news_with_bloc/domain/modules/article.dart';
import 'package:mobile_news_with_bloc/domain/repositories/article_repository.dart';

import '../data_source/database/app_database_provider.dart';

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl(
    this._articleService,
    this._appDatabaseProvider,
  );

  final ArticleService _articleService;
  final AppDatabaseProvider _appDatabaseProvider;

  @override
  Future<List<Article>> getBreakingArticle() async {
    final response = await _articleService.getArticle(
        country: RestQueryKeys.countryUS,
        category: RestQueryKeys.categoryScience,
        sortBy: RestQueryKeys.sortPopularity);
    final articles =
        ArticleListResponse.fromJson(response.data).articles.map((article) => article.toArticle()).toList();
    final savedArticle = await _appDatabaseProvider.getArticles();
    List<Article> result = <Article>[];
    for (var element in articles) {
      List<Article> similar = <Article>[];
      for (var element2 in savedArticle) {
        if (element.id == element2.id) {
          similar.add(element2);
        }
      }
      if (similar.isNotEmpty) {
        result.add(element.mapTo(true));
      }else{
        result.add(element);
      }
    }
    return result;
  }

  @override
  Future<List<Article>> getTopStoreArticle() async {
    final response = await _articleService.getArticle(
        country: RestQueryKeys.countryUS,
        category: RestQueryKeys.categoryGeneral,
        sortBy: RestQueryKeys.sortPopularity);
    final articles =
        ArticleListResponse.fromJson(response.data).articles.map((article) => article.toArticle()).toList();
    final savedArticle = await _appDatabaseProvider.getArticles();
    List<Article> result = <Article>[];
    for (var element in articles) {
      List<Article> similar = <Article>[];
      for (var element2 in savedArticle) {
        if (element.id == element2.id) {
          similar.add(element2);
        }
      }
      if (similar.isNotEmpty) {
        result.add(element.mapTo(true));
      }else{
        result.add(element);
      }
    }
    return result;
  }

  @override
  Future<List<Article>> getRecommendedArticle() async {
    final response = await _articleService.getArticle(
        country: RestQueryKeys.countryUS,
        category: RestQueryKeys.categoryScience,
        sortBy: RestQueryKeys.sortPopularity);
    final articles =
        ArticleListResponse.fromJson(response.data).articles.map((article) => article.toArticle()).toList();
    final savedArticle = await _appDatabaseProvider.getArticles();
    List<Article> result = <Article>[];
    for (var element in articles) {
      List<Article> similar = <Article>[];
      for (var element2 in savedArticle) {
        if (element.id == element2.id) {
          similar.add(element2);
        }
      }
      if (similar.isNotEmpty) {
        result.add(element.mapTo(true));
      }else{
        result.add(element);
      }
    }
    return result;
  }

  @override
  Future<List<Article>> getReadLaterArticle() async {
    final articles = await _appDatabaseProvider.getArticles();
    List<Article> newArticles = <Article>[];
    for (var element in articles) {
      newArticles.add(element.mapTo(true));
    }
    return newArticles;
  }

  @override
  Future<void> addFavoriteArticle(Article article) async {
    await _appDatabaseProvider.addFavoriteArticle(article);
  }

  @override
  Future<void> removeFavoriteArticle(Article article) async {
    await _appDatabaseProvider.removeFavoriteArticle(article);
  }
}
