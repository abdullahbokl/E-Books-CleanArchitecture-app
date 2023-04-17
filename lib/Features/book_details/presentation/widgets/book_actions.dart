import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimensions.dart';

class BookActions extends StatelessWidget {
  const BookActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensions.widthCalculator(20)),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text: '\$200',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.heightCalculator(16)),
                bottomLeft: Radius.circular(AppDimensions.heightCalculator(16)),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: AppColors.previewButtonColor,
              textColor: Colors.white,
              text: 'Show Preview',
              fontSize: AppDimensions.heightCalculator(14),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppDimensions.heightCalculator(16)),
                bottomRight:
                    Radius.circular(AppDimensions.heightCalculator(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
