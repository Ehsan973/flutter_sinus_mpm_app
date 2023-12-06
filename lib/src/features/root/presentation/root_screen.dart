import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/features/root/widget/navbar.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('RootScreen'));

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      routes: const [
        ProfileRoute(),
        JoinPoolRoute(),
        CreatePoolRoute(),
      ],

      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return ScaffoldWithNavbar(tabsRouter, child);
      },
    );
  }
}

class NavBarItem {
  final Widget icon;
  final String label;

  NavBarItem(this.icon, this.label);
}

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.tabsRouter, this.child, {super.key});

  final TabsRouter tabsRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        height: 88.5,
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.bounceInOut,
        child: BottomNavBar(
          onDestinationSelected: tabsRouter.setActiveIndex,
          selectedIndex: tabsRouter.activeIndex,
        ),
      ),
      body: Row(
        children: [
          Expanded(child: child),
        ],
      ),
    );
  }
}
