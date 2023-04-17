import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/images.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 2,
      child: Container(
        height: AppDimensions.height200,
        width: AppDimensions.width200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius20),
          image: const DecorationImage(
            image: AssetImage(AppImages.imagesTestImageJpg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
