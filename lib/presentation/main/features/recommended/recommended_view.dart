import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/vertical/big/article_big_vertical_empty.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/vertical/big/article_big_vertical_error_widget.dart';
import 'package:mobile_news_with_bloc/core/widgets/common%20/buildable.dart';
import 'package:mobile_news_with_bloc/presentation/main/features/recommended/bloc/recommended_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/article/vertical/big/article_big_vertical.dart';
import '../../../../core/widgets/article/vertical/big/article_big_vertical_shimmer.dart';
import '../../../../domain/modules/article.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Buildable<RecommendedBloc, RecommendedState, RecommendedBuildable>(
      properties: (buildable) => [
        buildable.recommendedArticlesState,
      ],
      builder: (BuildContext context, buildable) => Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF0F0F0),
          title: "Recommended ".w(500).s(20).c(Colors.black),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemBuilder: (BuildContext context, int index) {
              return switch (buildable.recommendedArticlesState) {
                LoadingState.loading => const ArticleBigVerticalShimmerWidget(),
                LoadingState.loaded => ArticleBigVerticalWidget(
                    article: buildable.recommendedArticles[index],
                    callback: (Article article) {
                      context.router.push(DetailRoute(article: article));
                    },
                    mutateFavorite: (Article article) {
                      context
                          .read<RecommendedBloc>()
                          .add(AddFavoriteEvent(article));
                    },
                  ),
                LoadingState.error =>
                  ArticleBigVerticalErrorWidget(callback: () {}),
                LoadingState.empty => const ArticleBigVerticalEmptyWidget(),
              };
            },
            itemCount: switch (buildable.recommendedArticlesState) {
              LoadingState.loading => 5,
              LoadingState.loaded => buildable.recommendedArticles.length,
              LoadingState.error => 1,
              LoadingState.empty => 1,
            }),
      ),
    );
  }
}
