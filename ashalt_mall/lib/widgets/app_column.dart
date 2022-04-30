import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double size;
  const AppColumn({Key? key, required this.text, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: size,
        ),
        SizedBox(height: Dimensions.height10),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) =>
                    Icon(Icons.star, color: AppColors.mainColor, size: 15)),
          ),
          SizedBox(width: 10),
          SmallText(text: "4.5"),
          SizedBox(width: 10),
          SmallText(text: "1287"),
          SizedBox(width: 10),
          SmallText(text: "Comments"),
        ]),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconText(
                icon: Icons.access_time_rounded,
                text: "Normal",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
