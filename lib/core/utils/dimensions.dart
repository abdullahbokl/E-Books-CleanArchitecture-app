class AppDimensions {
  static double screenHeight = 0;
  static double screenWidth = 0;

  static double heightCalculator(double height) {
    return AppDimensions.screenHeight / (783.2727272727273 / height);
  }

  static double widthCalculator(double width) {
    return AppDimensions.screenWidth / (392.72727272727275 / width);
  }
}
