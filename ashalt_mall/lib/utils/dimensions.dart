import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // 781
  static double screenWidth = Get.context!.width; // 392

// scaling pageview items
  static double pageView = screenHeight / 2.44; // is 781320
  static double pageViewContainer = screenHeight / 3.55; // 781/220
  static double pageViewTextContainer = screenHeight / 6.51; // 781/120

// padding and margin heights scaled
  static double height10 = screenHeight / 78.1;
  static double height15 = screenHeight / 52.06;
  static double height20 = screenHeight / 39.05;
  static double height30 = screenHeight / 26.03;
  static double height45 = screenHeight / 17.35;

// padding and margin width scaled    //392 is the width
  static double width10 = screenWidth / 39.2;
  static double width15 = screenWidth / 26.13;
  static double width20 = screenWidth / 19.6;
  static double width30 = screenWidth / 13.08;
  static double width45 = screenWidth / 8.71;

// font scaling based on screen
  static double font20 = screenHeight / 39.05;
  static double font26 = screenHeight / 30.04;
  static double font16 = screenHeight / 48.81;

  static double radius15 = height15;
  static double radius20 = height20;
  static double radius30 = height30;

// icon size
  static double iconSize16 = screenHeight / 48.81;
  static double iconSize24 = screenHeight / 32.54;
  static double iconSize35 = screenHeight / 22.31;

// listview items sizes
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenHeight / 7.81;

// popular food detail
  static double popularFoodDetailImageSize = screenHeight / 2.44;

// bottom bar height
  static double bottomBarHeight = screenHeight / 6.5;
}
