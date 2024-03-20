import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../domain/modules/article.dart';
import 'bloc/detail_bloc.dart';
import 'detail_view.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => getIt<DetailBloc>(),
      child: BlocListener<DetailBloc, DetailState>(
        listenWhen: (_, state) => state is DetailListenable,
        listener: (context, listenable) {},
        child: DetailView(article: article),
      ),
    );
  }
}
