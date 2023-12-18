import 'package:flutter/material.dart';

BottomNavigationBarItem buildNavItem(
    {required String label,
    required IconData iconData,

    }) {
  return BottomNavigationBarItem(
      label: label,
      icon: Icon(iconData)
  );
}

List<BottomNavigationBarItem> get buildNavItems => [
      buildNavItem(
        label: "Business",
        iconData: Icons.business,
      ),
      buildNavItem(
        label: "Science",
        iconData: Icons.science,
      ),
      buildNavItem(
        label: "Sports",
        iconData: Icons.sports_basketball,
      ),
      buildNavItem(
        label: "Settings",
        iconData: Icons.settings,
      ),
    ];
