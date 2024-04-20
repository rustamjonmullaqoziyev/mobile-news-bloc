import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/presentation/main/bloc/main_bloc.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/widgets/common /buildable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (_) => getIt<MainBloc>(),
        child: Buildable<MainBloc, MainState, MainBuildable>(
          properties: (buildable) => [buildable.isDark, buildable.isConnection],
          builder: (BuildContext context, buildable) {
            buildable.isDark
                ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark)
                : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
            return MaterialApp.router(
              routerConfig: _appRouter.config(),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}
