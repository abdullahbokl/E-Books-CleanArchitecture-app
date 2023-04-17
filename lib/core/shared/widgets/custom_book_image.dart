import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../utils/images.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 2,
      child: Container(
        height: AppDimensions.heightCalculator(200),
        width: AppDimensions.widthCalculator(200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.heightCalculator(20)),
          image: const DecorationImage(
            image: AssetImage(AppImages.imagesTestImageJpg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
