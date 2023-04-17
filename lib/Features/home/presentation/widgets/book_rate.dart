import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';

class BookRate extends StatelessWidget {
  const BookRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.solidStar,
          color: AppColors.rateStarColor,
          size: AppDimensions.heightCalculator(15),
        ),
        SizedBox(width: AppDimensions.widthCalculator(5)),
        Text('4.8', style: AppStyles.textStyle16),
        SizedBox(width: AppDimensions.widthCalculator(3)),
        Text(
          '(245)',
          style: AppStyles.textStyle14.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
