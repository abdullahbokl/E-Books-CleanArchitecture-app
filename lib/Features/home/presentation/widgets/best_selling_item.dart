import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/styles.dart';
import 'book_rate.dart';

class BestSellingListViewItem extends StatelessWidget {
  const BestSellingListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightCalculator(120),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.5 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(AppDimensions.heightCalculator(20)),
                image: const DecorationImage(
                  image: AssetImage(AppImages.imagesTestImageJpg),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(width: AppDimensions.widthCalculator(30)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book number1 name1 sdafsafsdfsfsda',
                  style: AppStyles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDimensions.heightCalculator(5)),
                Text(
                  'Book author',
                  style: AppStyles.textStyle14,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '\$200',
                      style: AppStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const BookRate(),
                  ],
                ),
                SizedBox(height: AppDimensions.heightCalculator(5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
