import 'package:ashalt_mall/controllers/popular_product_controller.dart';
import 'package:ashalt_mall/controllers/recommended_product_controller.dart';
import 'package:ashalt_mall/pages/food/recommended_food_detail.dart';
import 'package:ashalt_mall/pages/home/food_page_body.dart';
import 'package:ashalt_mall/pages/home/main_food_page.dart';
import 'package:ashalt_mall/routes/route_helper.dart';
// import 'package:ashalt_mall/pages/home/main_food_page.dart';
// import 'package:ashalt_mall/pages/food/popular_food_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ashalt_mall/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Ashalt Mall',
      debugShowCheckedModeBanner: false,
      
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
