import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';

class ArticleBigHorizontalEmptyWidget extends StatelessWidget {
  const ArticleBigHorizontalEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:600,
      width: MediaQuery.of(context).size.width,
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
