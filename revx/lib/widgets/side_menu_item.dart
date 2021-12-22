import 'package:flutter/material.dart';
import 'package:revx/helpers/responsiveness.dart';
import 'package:revx/widgets/widgets.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;
  const SideMenuItem({Key? key, required this.itemName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context))
      return VerticalMenuItem(itemName: itemName, onTap: onTap);

    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
