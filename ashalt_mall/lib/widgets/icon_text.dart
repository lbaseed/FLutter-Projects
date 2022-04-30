import 'package:ashalt_mall/utils/dimensions.dart';
import 'package:ashalt_mall/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24),
        const SizedBox(width: 5.0),
        SmallText(text: text),
      ],
    );
  }
}
