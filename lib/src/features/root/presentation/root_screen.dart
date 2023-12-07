import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/features/root/widget/curved_navigation_bar-master/curved_navigation_bar.dart';
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

class ScaffoldWithNavbar extends StatefulWidget {
  const ScaffoldWithNavbar(this.tabsRouter, this.child, {super.key});

  final TabsRouter tabsRouter;
  final Widget child;

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RotatedBox(
        quarterTurns: 2,
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 14,
                      child: Container(
                          height: 14,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              ),
              CurvedNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                index: widget.tabsRouter.activeIndex,
                height: 50,
                animationDuration: const Duration(milliseconds: 300),
                buttonBackgroundColor: Theme.of(context).colorScheme.primary,
                items: <Widget>[
                  NavBarItem(
                    iconPath: Icons.person,
                    id: 0,
                    selectedIndex: widget.tabsRouter.activeIndex,
                    label: 'پروفایل',
                  ),
                  NavBarItem(
                    id: 1,
                    selectedIndex: widget.tabsRouter.activeIndex,
                    iconPath: Icons.group,
                    label: 'جوین شدن',
                  ),
                  NavBarItem(
                    id: 2,
                    selectedIndex: widget.tabsRouter.activeIndex,
                    iconPath: Icons.add,
                    label: 'استخر جدید',
                  ),

                  // this items will be add in future
                ],
                onTap: (index) {
                  widget.tabsRouter.setActiveIndex(index);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData iconPath;
  final String label;
  final int id;
  final int selectedIndex;
  const NavBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.id,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final color = id == selectedIndex ? Colors.white : Colors.black;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconPath,
          color: color,
        ),
        const SizedBox(
          height: 2.5,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: color,
              ),
        )
      ],
    );
  }
}
