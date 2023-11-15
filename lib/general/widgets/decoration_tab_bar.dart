import 'package:flutter/material.dart';

class DecorationTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DecorationTabBar({
    super.key,
    required this.tabBar,
    required this.decoration,
  });

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }

  @override
  Size get preferredSize => tabBar.preferredSize;
}
