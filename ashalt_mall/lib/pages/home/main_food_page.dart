import 'package:ashalt_mall/pages/home/food_page_body.dart';
import 'package:ashalt_mall/utils/dimensions.dart';
import 'package:ashalt_mall/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print("Screen Height is: " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          // header container
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Nigeria",
                        color: AppColors.mainColor,
                      ),
                      Row(children: [
                        SmallText(text: "Gombe", color: Colors.black54),
                        Icon(Icons.arrow_drop_down_rounded)
                      ]),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSize24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // page content scrolling
          Expanded(
            child: SingleChildScrollView(child: FoodPageBody()),
          )
        ],
      ),
    );
  }
}
