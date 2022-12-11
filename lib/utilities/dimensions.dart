import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; //899.43
  static double screenWidth = Get.context!.width; //411.43
//dynamic container height
  static double pageView = screenHeight / 2.81; //899/320
  static double pageViewContainer = screenHeight / 4.08; //899/220
  static double pageViewTextContainer = screenHeight / 7.49; //899/120
//dynamic height
  static double height10 = screenHeight / 89.9; //899/10
  static double height20 = screenHeight / 44.95; //899/20
  static double height15 = screenHeight / 59.33; //899/15
  static double height30 = screenHeight / 29.97; //899/30
  static double height45 = screenHeight / 19.98; //899/45
//dynamic width
  static double width10 = screenWidth / 41.1; //411/10
  static double width20 = screenWidth / 20.5; //411/20
  static double width15 = screenWidth / 27.4; //411/15
  static double width30 = screenWidth / 13.7; //411/30
//dynamic font size

  static double fontSize16 = screenHeight / 56.18; //899/16
  static double fontSize20 = screenHeight / 44.95; //899/20
  static double fontSize26 = screenHeight / 34.57; //899/26
//dynamic borderradius
  static double radius20 = screenHeight / 44.95;
  static double radius30 = screenHeight / 29.97; //899/30

//icon size
  static double iconSize24 = screenHeight / 37.45; //899/24
  static double iconSize16 = screenHeight / 56.18; //899/24

//listView
  static double listViewImg = screenWidth / 3.43; //411/120
  static double listViewTextContainer = screenWidth / 4.11; //411/100
//popular food
  static double popularImgSize = screenHeight / 2.57; //899/350

//bottom navigation height
  static double bottomHeight120 = screenHeight / 7.49; //899/120

//splash screen
  static double splashScreen250 = screenHeight / 3.59; //899/220
}
