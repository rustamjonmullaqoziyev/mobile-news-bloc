import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';
import 'package:mobile_news_with_bloc/core/utils/utils.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/horizontal/big/article_big_horizontal_empty.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/horizontal/big/article_big_horizontal_error.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/horizontal/small/article_small_horizontal_empty.dart';
import 'package:mobile_news_with_bloc/core/widgets/article/horizontal/small/article_small_horizontal_error_widget.dart';
import 'package:mobile_news_with_bloc/core/widgets/common%20/buildable.dart';
import 'package:mobile_news_with_bloc/presentation/main/features/dashboard/bloc/dashboard_bloc.dart';

import '../../../../core/widgets/article/horizontal/big/article_big_horizontal.dart';
import '../../../../core/widgets/article/horizontal/big/article_big_horizontal_shimmer.dart';
import '../../../../core/widgets/article/horizontal/small/article_small_horizontal.dart';
import '../../../../core/widgets/article/horizontal/small/article_small_horizontal_shimmer.dart';
import '../../../../domain/modules/article.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Buildable<DashboardBloc, DashboardState, DashboardBuildable>(
      properties: (buildable) => [
        buildable.breakingArticlesState,
        buildable.topStoreArticlesState,
        buildable.topStoreArticles,
        buildable.breakingArticles
      ],
      builder: (BuildContext context, buildable) {
        return Scaffold(
            backgroundColor: const Color(0xFFF0F0F0),
            body: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: "Breaking News".w(500).s(20).c(Colors.black)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return switch (buildable.breakingArticlesState) {
                          LoadingState.loading =>
                            const ArticleBigHorizontalShimmerWidget(),
                          LoadingState.loaded => ArticleBigHorizontalWidget(
                              article: buildable.breakingArticles[index],
                              callback: (Article article) {
                                context
                                    .read<DashboardBloc>()
                                    .add(AddFavoriteEvent(article));
                                context.router
                                    .push(DetailRoute(article: article));
                              },
                              mutateFavorite: (Article article) {
                                context
                                    .read<DashboardBloc>()
                                    .add(AddFavoriteEvent(article));
                              },
                            ),
                          LoadingState.error =>
                            ArticleBigHorizontalErrorWidget(callback: () {
                              context
                                  .read<DashboardBloc>()
                                  .add(GetBreakingArticleEvent());
                            }),
                          LoadingState.empty =>
                            const ArticleBigHorizontalEmptyWidget(),
                        };
                      },
                      itemCount: switch (buildable.breakingArticlesState) {
                        LoadingState.loading => 5,
                        LoadingState.loaded =>
                          buildable.breakingArticles.length,
                        LoadingState.error => 1,
                        LoadingState.empty => 1,
                      }),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: "Top Stories".w(500).s(20).c(Colors.black),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return switch (buildable.topStoreArticlesState) {
                          LoadingState.loading =>
                            const ArticleSmallHorizontalShimmerWidget(),
                          LoadingState.loaded => ArticleSmallHorizontalWidget(
                              article: buildable.topStoreArticles[index],
                              callback: (Article article) {
                                context.router
                                    .push(DetailRoute(article: article));
                              },
                              mutateFavorite: (Article article) {
                                context
                                    .read<DashboardBloc>()
                                    .add(AddFavoriteEvent(article));
                              },
                            ),
                          LoadingState.error =>
                            ArticleSmallHorizontalErrorWidget(callback: () {
                              context
                                  .read<DashboardBloc>()
                                  .add(GetTopArticleEvent());
                            }),
                          LoadingState.empty =>
                            const ArticleSmallHorizontalEmptyWidget(),
                        };
                      },
                      itemCount: switch (buildable.topStoreArticlesState) {
                        LoadingState.loading => 5,
                        LoadingState.loaded =>
                          buildable.topStoreArticles.length,
                        LoadingState.error => 1,
                        LoadingState.empty => 1
                      }),
                ),
                const SizedBox(height: 20),
              ],
            ));
      },
    );
  }
}
