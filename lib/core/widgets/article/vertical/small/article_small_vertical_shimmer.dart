import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:shimmer/shimmer.dart';

class ArticleSmallVerticalShimmerWidget extends StatelessWidget {
  const ArticleSmallVerticalShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.colorCardBackground,
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
                Shimmer.fromColors(
                    baseColor: context.colors.colorShimmerBase,
                    highlightColor:context.colors.colorShimmerHighlight,
                    child: Container(
                      width: 120,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.colors.colorCardBackground,
                      ),
                    )),
                const SizedBox(height: 10),
                Expanded(
                  child: Shimmer.fromColors(
                      baseColor: context.colors.colorShimmerBase,
                      highlightColor:context.colors.colorShimmerHighlight,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.colorCardBackground,
                        ),
                      )),
                ),
                const SizedBox(height: 10),
                Shimmer.fromColors(
                    baseColor: context.colors.colorShimmerBase,
                    highlightColor:context.colors.colorShimmerHighlight,
                    child: Container(
                      width: 140,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.colors.colorCardBackground,
                      ),
                    )),
              ],
            ),
          )),
          const SizedBox(width: 8),
          Shimmer.fromColors(
              enabled: true,
              baseColor: context.colors.colorShimmerBase,
              highlightColor:context.colors.colorShimmerHighlight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.colorCardBackground,
                ),
                width: 100,
                height: 100,
              )),
        ],
      ),
    );
  }
}
