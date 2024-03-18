import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/extensions/text_extensions.dart';

class ReadLaterView extends StatelessWidget {
  const ReadLaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "ReadLater".w(500).s(20).c(Colors.black),
      ),
    );
  }
}
