import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.50, color: Color(0xFFE5E9F3)),
                ),
              ),
              child: BottomNavigationBar(
                enableFeedback: true,
                type: BottomNavigationBarType.fixed,
                elevation: 1,
                selectedItemColor: Colors.black,
                backgroundColor: Colors.white,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    label: "Dashboard",
                    tooltip: "Dashboard",
                    icon: Assets.images.icBottomNavigationHome.svg(width: 24, height: 24),
                    activeIcon: Assets.images.icBottomNavigationHomeActive.svg(width: 24, height: 24),
                  ),
                  BottomNavigationBarItem(
                      label: "Recommended",
                      tooltip: "Recommended",
                      icon: Assets.images.icBottomNavigationRecommended.svg(width: 24, height: 24),
                      activeIcon: Assets.images.icBottomNavigationRecommendedActive.svg(width: 24, height: 24)),
                  BottomNavigationBarItem(
                      label: "Read Later",
                      tooltip: "Read Later",
                      icon: Assets.images.icBottomNavigationBookmark.svg(width: 24, height: 24),
                      activeIcon: Assets.images.icBottomNavigationBookmarkActive.svg(width: 24, height: 24)),
                ],
              ),
            ));
      },
    );
  }
}
