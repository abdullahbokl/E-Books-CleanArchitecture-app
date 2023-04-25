import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/utils/styles.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: AppStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(15)),
        SizedBox(
          height: AppDimensions.heightCalculator(100),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(right: AppDimensions.widthCalculator(5)),
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRouter.bookDetails),
                  child: CustomBookImage(imageUrl: ''),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
