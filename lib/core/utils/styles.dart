import 'package:flutter/material.dart';

import 'dimensions.dart';

abstract class AppStyles {
  static TextStyle textStyle14 = TextStyle(
    fontSize: AppDimensions.heightCalculator(14),
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle16 = TextStyle(
    fontSize: AppDimensions.heightCalculator(16),
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle18 = TextStyle(
    fontSize: AppDimensions.heightCalculator(18),
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: AppDimensions.heightCalculator(20),
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle30 = TextStyle(
    fontSize: AppDimensions.heightCalculator(30),
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );
}
