import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';

import '../../../common /common_elevated_button.dart';

class ArticleBigVerticalErrorWidget extends StatelessWidget {
  const ArticleBigVerticalErrorWidget({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "An error occurred. Try again"
              .w(500)
              .s(24)
              .c(context.colors.colorTextPrimary)
              .copyWith(textAlign: TextAlign.center),
          const SizedBox(height: 8),
          CommonElevatedButton(
              callback: callback,
              onLoading: false,
              child: "Try again".w(500).s(16).c(context.colors.colorTextPrimary)),
        ],
      ),
    );
  }
}
