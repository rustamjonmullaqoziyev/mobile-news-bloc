import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';

class ArticleBigVerticalEmptyWidget extends StatelessWidget {
  const ArticleBigVerticalEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Nothing found"
              .w(500)
              .s(24)
              .c(Colors.black)
              .copyWith(textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
