import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/vertical/small/article_small_vertical.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/vertical/small/article_small_vertical_empty.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/vertical/small/article_small_vertical_error_widget.dart';
import 'package:mobile_news_with_bloc/presentation/main/features/read_later/bloc/read_later_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/article/vertical/small/article_small_vertical_shimmer.dart';
import '../../../../core/widgets/common /buildable.dart';
import '../../../../domain/modules/article.dart';

class ReadLaterView extends StatelessWidget {
  const ReadLaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Buildable<ReadLaterBloc, ReadLaterState, ReadLaterBuildable>(
      properties: (buildable) => [buildable.readLaterArticlesState, buildable.readLaterArticles],
      builder: (BuildContext context, buildable) => Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF0F0F0),
          title: "Top ".w(500).s(20).c(Colors.black),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemBuilder: (BuildContext context, int index) {
              return switch (buildable.readLaterArticlesState) {
                LoadingState.loading => const ArticleSmallVerticalShimmerWidget(),
                LoadingState.loaded => ArticleSmallVerticalWidget(
                    article: buildable.readLaterArticles[index],
                    callback: (Article article) {
                      context.router.push(DetailRoute(article: article));
                    },
                    mutateFavorite: (Article article) {
                      context.read<ReadLaterBloc>().add(RemoveFavoriteEvent(article));
                    },
                  ),
                LoadingState.error => ArticleSmallVerticalErrorWidget(callback: () {
                    context.read<ReadLaterBloc>().add(GetReadLaterArticleEvent());
                  }),
                LoadingState.empty => const ArticleSmallVerticalEmptyWidget(),
              };
            },
            itemCount: switch (buildable.readLaterArticlesState) {
              LoadingState.loading => 5,
              LoadingState.loaded => buildable.readLaterArticles.length,
              LoadingState.error => 1,
              LoadingState.empty => 1
            }),
      ),
    );
  }
}
