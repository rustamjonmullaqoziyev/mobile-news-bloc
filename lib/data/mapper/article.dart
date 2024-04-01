import 'package:mobile_news_with_bloc/data/responses/article/article_list_response.dart';

import '../../domain/modules/article.dart';

extension ArticleResponseExtension on ArticleResponse {
  Article toArticle({bool isFavourite = false}) {
    return Article(
      id: "${author ?? ""}${title ?? ""}${url ?? ""}",
      author: author ?? "",
      title: title ?? "",
      description: description ?? "",
      url: url ?? "",
      urlToImage: urlToImage ?? "",
      publishedAt: publishedAt,
      content: content ?? "",
      sourceName: source?.name ?? "",
      sourceId: source?.id ?? "",
      isFavourite: isFavourite,
    );
  }
}
