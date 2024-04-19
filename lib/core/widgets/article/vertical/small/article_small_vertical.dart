import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';
import 'package:mobile_news_with_bloc/core/utils/utils.dart';

import '../../../../../domain/modules/article.dart';
import '../../../favorites/ad_favorite_widget.dart';

class ArticleSmallVerticalWidget extends StatelessWidget {
  const ArticleSmallVerticalWidget({
    super.key,
    required this.article,
    required this.callback,
    required this.mutateFavorite,
  });

  final Article article;
  final Function(Article article) callback;
  final Function(Article article) mutateFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => callback(article),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    article.sourceName
                        .w(500)
                        .s(20)
                        .c(Colors.black)
                        .copyWith(maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 10),
                    Expanded(
                      child: article.title.w(400).s(15).c(Colors.black).copyWith(
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    const SizedBox(height: 10),
                    article.publishedAt != null
                        ? article.publishedAt!.formattedDate.w(400).s(16).c(Colors.grey)
                        : "".w(400).s(16).c(Colors.grey)
                  ],
                ),
              )),
              const SizedBox(width: 8),
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    CachedNetworkImage(
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
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: FavoriteWidget(
                          isSelected: article.isFavourite,
                          invoke: () {
                            mutateFavorite(article);
                          },
                          isChangeAvailable: false,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
