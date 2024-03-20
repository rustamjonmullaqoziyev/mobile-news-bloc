import 'package:auto_route/auto_route.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MainRoute.page,
            path: "/main",
            initial: true,
            children: [
              AutoRoute(
                page: DashboardRoute.page,
                path: "dashboard",
                initial: true,
                maintainState: false
              ),
              AutoRoute(page: RecommendedRoute.page, path: 'recommended', maintainState: false),
              AutoRoute(page: ReadLaterRoute.page, path: 'read-later'),
            ]),
        AutoRoute(page: DetailRoute.page, path: "/detail")
      ];
}
