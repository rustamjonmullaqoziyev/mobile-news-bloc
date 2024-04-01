import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';
import 'package:mobile_news_with_bloc/core/utils/utils.dart';

import '../../../../../domain/modules/article.dart';

class ArticleBigHorizontalWidget extends StatelessWidget {
  const ArticleBigHorizontalWidget(
      {super.key, required this.article, required this.callback});

  final Article article;
  final Function(Article article) callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => callback(article),
        child: Container(
          width: 320,
          height: 600,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageBuilder: (context, url) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: url,
                          fit: BoxFit.fill,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.colorBurn,
                          ),
                        ),
                      ),
                    ),
                    imageUrl: article.urlToImage,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10),
                article.sourceName
                    .w(500)
                    .s(20)
                    .c(Colors.black)
                    .copyWith(maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                Expanded(
                    child: article.title.w(400).s(15).c(Colors.black).copyWith(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )),
                const SizedBox(height: 10),
                article.publishedAt != null
                    ? article.publishedAt!.formattedDate
                        .w(400)
                        .s(16)
                        .c(Colors.grey)
                    : "".w(400).s(16).c(Colors.grey)
              ]),
        ));
  }
}
