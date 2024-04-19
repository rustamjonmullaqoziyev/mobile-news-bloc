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

  factory Article.fromJson(Map<String, dynamic> data) => Article(
        id: data["id"],
        author: data["author"],
        title: data["title"],
        description: data["description"],
        url: data["url"],
        urlToImage: data["urlToImage"],
        publishedAt: data["publishedAt"],
        content: data["content"],
        sourceName: data["sourceName"],
        sourceId: data["sourceId"],
        isFavourite: data["isFavourite"] == 1,
      );
}
