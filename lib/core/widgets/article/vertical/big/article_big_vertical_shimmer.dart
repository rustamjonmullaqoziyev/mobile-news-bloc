import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:shimmer/shimmer.dart';

class ArticleBigVerticalShimmerWidget extends StatelessWidget {
  const ArticleBigVerticalShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.colorCardBackground,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
                enabled: true,
                baseColor:context.colors.colorShimmerBase,
                highlightColor:context.colors.colorShimmerHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.colorCardBackground
                  ),
                  width: double.infinity,
                  height: 150,
                )),
            const SizedBox(height: 10),
            Shimmer.fromColors(
                baseColor:context.colors.colorShimmerBase,
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
                  baseColor:context.colors.colorShimmerBase,
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
                baseColor:context.colors.colorShimmerBase,
                highlightColor:context.colors.colorShimmerHighlight,
                child: Container(
                  width: 140,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.colorCardBackground,
                  ),
                )),
          ]),
    );
  }
}
