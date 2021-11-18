import 'package:campus_album/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isButtomIndicator;

  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isButtomIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isButtomIndicator
              ? Border(
                  bottom: BorderSide(
                    color: Palette.facebookBlue,
                    width: 3.0,
                  ),
                )
              : Border(
                  top: BorderSide(
                    color: Palette.facebookBlue,
                    width: 3.0,
                  ),
                )),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: Palette.facebookBlue,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
