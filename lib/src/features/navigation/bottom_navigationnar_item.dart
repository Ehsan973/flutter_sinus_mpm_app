import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/utils/animtation.dart';

class BottomNavigationBarCustomItem extends StatelessWidget {
  final int id;
  final String label;
  final IconData icon;
  final IconData actvieIcon;
  final int selectedIndex;

  const BottomNavigationBarCustomItem({
    super.key,
    required this.onDestinationSelected,
    required this.id,
    required this.label,
    required this.icon,
    required this.selectedIndex,
    required this.actvieIcon,
  });

  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = id == selectedIndex;
    return Expanded(
      child: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          onDestinationSelected(id);
        },
        child: Stack(
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      isSelected ? actvieIcon : icon,
                      semanticLabel: 'icon',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (isSelected)
                      AnimatedItem(
                        duration: const Duration(milliseconds: 150),
                        child: Text(
                          label,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 425),
              bottom: !isSelected ? -44 : 0,
              left: 0,
              right: 0,
              key: key,
              child: AnimatedContainer(
                curve: Curves.easeInCirc,
                duration: const Duration(
                  milliseconds: 200,
                ),
                width: 44,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
