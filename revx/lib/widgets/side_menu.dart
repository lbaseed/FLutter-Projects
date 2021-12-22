import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revx/constants/controllers.dart';
import 'package:revx/constants/style.dart';
import 'package:revx/helpers/responsiveness.dart';
import 'package:revx/routing/routes.dart';
import 'package:revx/widgets/widgets.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "assets/icons/revx.png",
                        width: 100,
                        height: 50,
                      ),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dashboard",
                        color: active,
                        size: 20,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
              ],
            ),
          SizedBox(height: 40),
          Divider(color: lightGrey.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                      itemName:
                          itemName == AuthPageRoute ? "Log Out" : itemName,
                      onTap: () {
                        if (itemName == AuthPageRoute) {
                          // TODO:: go to authentication page
                        }

                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveItemTo(itemName);

                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();

                            // TODO:: go to itemname route
                          }
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
