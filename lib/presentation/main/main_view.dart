import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/router/app_router.gr.dart';

import '../../core/widgets/bottom_navigation/navigation_bar.dart';

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
              height: 82,
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
                items: const [
                  BottomNavigationBarItem(
                    label: "Dashboard",
                    tooltip: "Dashboard",
                    icon: NavigationBarWidget(image: Icon(Icons.dashboard)),
                    activeIcon: NavigationBarWidget(
                        image: Icon(
                      Icons.dashboard,
                      color: Colors.black,
                    )),
                  ),
                  BottomNavigationBarItem(
                      label: "Recommended",
                      tooltip: "Recommended",
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.account_box_outlined),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: Colors.black,
                        ),
                      )),
                  BottomNavigationBarItem(
                      label: "Read Later",
                      tooltip: "Read Later",
                      icon: NavigationBarWidget(
                          image: Icon(Icons.bookmark_border_outlined)),
                      activeIcon: NavigationBarWidget(
                        image: Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ));
      },
    );
  }
}
