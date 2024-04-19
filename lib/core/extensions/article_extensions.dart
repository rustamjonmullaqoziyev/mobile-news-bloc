import '../../domain/modules/article.dart';

extension ArticleExtension on Article {
  Article mapTo(bool favouriteStatus) {
    return Article(
      id: id,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      author: author,
      sourceName: sourceName,
      sourceId: sourceId,
      isFavourite: favouriteStatus,
    );
  }
}
