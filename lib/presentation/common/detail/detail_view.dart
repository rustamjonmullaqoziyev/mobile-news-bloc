import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';
import 'package:mobile_news_with_bloc/core/utils/utils.dart';
import 'package:mobile_news_with_bloc/presentation/common/detail/bloc/detail_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/widgets/favorites/ad_favorite_widget.dart';
import '../../../domain/modules/article.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.colorBackgroundPrimary,
        appBar: AppBar(
          backgroundColor: context.colors.colorBackgroundPrimary,
          title: article.title.w(500).s(16).c(context.colors.colorTextPrimary),
          leading: IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: Icon(Icons.arrow_back, color: context.colors.colorIcon),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Share.share("${article.title} ${article.description} ${article.content} ${article.url}");
              },
              icon: const Icon(Icons.share),
            ),
            FavoriteWidget(
                isSelected: article.isFavourite,
                invoke: () {
                  context.read<DetailBloc>().add(AddFavoriteEvent(article));
                })
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: context.colors.colorCardBackground),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
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
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10),
                article.sourceName
                    .w(500)
                    .s(20)
                    .c(context.colors.colorTextPrimary)
                    .copyWith(maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                article.description.w(400).s(15).c(context.colors.colorTextPrimary).copyWith(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                const SizedBox(height: 10),
                article.publishedAt != null
                    ? article.publishedAt!.formattedDate.w(400).s(16).c(Colors.grey)
                    : "".w(400).s(16).c(Colors.grey),
                const SizedBox(height: 10),
                article.content.w(400).s(15).c(context.colors.colorTextPrimary).copyWith(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
              ]),
        ));
  }
}
