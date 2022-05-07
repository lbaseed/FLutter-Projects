import 'package:ashalt_mall/controllers/recommended_product_controller.dart';
import 'package:ashalt_mall/routes/route_helper.dart';
import 'package:ashalt_mall/utils/app_constants.dart';
import 'package:ashalt_mall/utils/colors.dart';
import 'package:ashalt_mall/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;

  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the instance of the selected item passed as pageId
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    // print("recommended product name is: " + product.name!);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 75,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // top page icons
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(
                          icon: Icons.clear, size: Dimensions.iconSize35)),
                  AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      size: Dimensions.iconSize35),
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10),
              // text container
              child: Container(
                // color: Colors.white,
                child: Center(
                    child:
                        BigText(text: product.name!, size: Dimensions.font26)),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Column(children: [
                Container(
                  child: ExpandableTextWidget(text: product.description!),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                )
              ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
              ),
              BigText(
                  text: "\$ ${product.price!} " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
              ),
            ],
          ),
        ),
        // add to cart buttom
        Container(
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
                child: Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                )),
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
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
