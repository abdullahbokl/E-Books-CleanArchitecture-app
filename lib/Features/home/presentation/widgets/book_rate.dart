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
      children: [
        Text(
          '\$200',
          style: AppStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        FaIcon(
          FontAwesomeIcons.solidStar,
          color: AppColors.rateStarColor,
          size: AppDimensions.iconSize15,
        ),
        SizedBox(width: AppDimensions.width5),
        Text('4.8', style: AppStyles.textStyle16),
        SizedBox(width: AppDimensions.width3),
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
