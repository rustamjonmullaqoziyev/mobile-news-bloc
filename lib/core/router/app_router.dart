import 'package:auto_route/auto_route.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: DetailRoute.page, path: "/detail", initial: true)];
}
