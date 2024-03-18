import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/presentation/main/features/read_later/read_later_view.dart';
import '../../../../core/di/injection.dart';
import 'bloc/read_later_bloc.dart';

@RoutePage()
class ReadLaterPage extends StatelessWidget {
  const ReadLaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => getIt<ReadLaterBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ReadLater'),
        ),
        body: BlocListener<ReadLaterBloc, ReadLaterState>(
          listenWhen: (_, state) => state is ReadLaterListenable,
          listener: (context, listenable) {},
          child: const ReadLaterView(),
        ),
      ),
    );
  }
}
