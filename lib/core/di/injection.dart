import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/di/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<GetIt> configureDependencies() async => getIt.init();
