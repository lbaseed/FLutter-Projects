import 'package:ashalt_mall/controllers/popular_product_controller.dart';
import 'package:ashalt_mall/pages/home/main_food_page.dart';
import 'package:ashalt_mall/utils/app_constants.dart';
import 'package:ashalt_mall/utils/utils.dart';
import 'package:ashalt_mall/widgets/app_column.dart';
import 'package:ashalt_mall/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;

  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // print("Page ID is" + pageId.toString());
    // print("Product name is : " + product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // top background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodDetailImageSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!),
                )),
              )),
          // top coner icons widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.height20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => MainFoodPage());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ]),
          ),
          // remaining page
          Positioned(
            top: Dimensions.popularFoodDetailImageSize - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!, size: Dimensions.font26),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Food Details"),
                  SizedBox(height: Dimensions.height20),
                  // expandable text widget
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text: product.description!))),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
          color: AppColors.buttonBackgroundColor,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // increment qty
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            child: Row(
              children: [
                Icon(Icons.remove, color: AppColors.signColor),
                SizedBox(width: Dimensions.width10),
                BigText(text: "0"),
                SizedBox(width: Dimensions.width10),
                Icon(Icons.add, color: AppColors.signColor)
              ],
            ),
          ),
          // add to cart button
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor),
            child: BigText(
              text: "\$ ${product.price!} | Add to cart",
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
