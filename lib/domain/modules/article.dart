import 'dart:core';

class Article {
  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.sourceName,
    required this.sourceId,
    required this.isFavourite,
  });

  final String id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime? publishedAt;
  final String content;
  final String sourceName;
  final String sourceId;
  final bool isFavourite;
}
