import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/color_extension.dart';
import 'package:mobile_news_with_bloc/core/gen/assets/assets.gen.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [DashboardRoute(), RecommendedRoute(), ReadLaterRoute()],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
            bottomNavigationBar: Container(
              height: 64,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.50, color: context.colors.colorBottomBorder),
                ),
              ),
              child: BottomNavigationBar(
                enableFeedback: true,
                type: BottomNavigationBarType.fixed,
                elevation: 1,
                unselectedItemColor: context.colors.colorTextPrimary,
                selectedItemColor: context.colors.colorTextPrimary,
                backgroundColor: context.colors.colorBackgroundPrimary,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    label: "Dashboard",
                    tooltip: "Dashboard",
                    icon: Assets.images.icBottomNavigationHome.svg(
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(context.colors.colorIcon, BlendMode.srcIn),
                    ),
                    activeIcon: Assets.images.icBottomNavigationHomeActive.svg(
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(context.colors.colorIcon, BlendMode.srcIn),
                    ),
                  ),
                  BottomNavigationBarItem(
                      label: "Recommended",
                      tooltip: "Recommended",
                      icon: Assets.images.icBottomNavigationRecommended.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(context.colors.colorIcon, BlendMode.srcIn),
                      ),
                      activeIcon: Assets.images.icBottomNavigationRecommendedActive.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(context.colors.colorIcon, BlendMode.srcIn),
                      )),
                  BottomNavigationBarItem(
                      label: "Read Later",
                      tooltip: "Read Later",
                      icon: Assets.images.icBottomNavigationBookmark.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(context.colors.colorIcon, BlendMode.srcIn),
                      ),
                      activeIcon: Assets.images.icBottomNavigationBookmarkActive.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(context.colors.colorIcon, BlendMode.srcIn),
                      )),
                ],
              ),
            ));
      },
    );
  }
}
