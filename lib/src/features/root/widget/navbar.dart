import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/utils/animtation.dart';
import 'package:sinus_mpm_application/src/features/navigation/bottom_navigationnar_item.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onDestinationSelected;
  final int selectedIndex;
  const BottomNavBar({
    super.key,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedItem(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 96,
            minHeight: 75,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavigationBarCustomItem(
                  id: 0,
                  label: 'پروفایل',
                  onDestinationSelected: onDestinationSelected,
                  selectedIndex: selectedIndex,
                  actvieIcon: Icons.person,
                  icon: Icons.person_2_outlined),
              BottomNavigationBarCustomItem(
                id: 1,
                label: 'رفتن به شنا',
                onDestinationSelected: onDestinationSelected,
                selectedIndex: selectedIndex,
                actvieIcon: Icons.join_full,
                icon: Icons.join_full_outlined,
              ),
              BottomNavigationBarCustomItem(
                id: 2,
                label: 'استخر جدید',
                onDestinationSelected: onDestinationSelected,
                selectedIndex: selectedIndex,
                actvieIcon: Icons.group,
                icon: Icons.group_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
