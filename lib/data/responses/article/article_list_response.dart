import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'article_list_response.freezed.dart';

part 'article_list_response.g.dart';

ArticleListResponse articleListResponseFromJson(String str) =>
    ArticleListResponse.fromJson(json.decode(str));

String articleListResponseToJson(ArticleListResponse data) =>
    json.encode(data.toJson());

@freezed
class ArticleListResponse with _$ArticleListResponse {
  const factory ArticleListResponse({
    String? status,
    int? totalResults,
    required List<ArticleResponse> articles,
  }) = _ArticleListResponse;

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleListResponseFromJson(json);
}

@freezed
class ArticleResponse with _$ArticleResponse {
  const factory ArticleResponse({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _ArticleResponse;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    dynamic id,
    String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
