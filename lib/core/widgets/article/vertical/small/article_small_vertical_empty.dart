import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';

class ArticleSmallVerticalEmptyWidget extends StatelessWidget {
  const ArticleSmallVerticalEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Nothing found"
              .w(500)
              .s(24)
              .c(context.colors.colorTextPrimary)
              .copyWith(textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
