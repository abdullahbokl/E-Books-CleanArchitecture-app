import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/shared/widgets/custom_book_image.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightCalculator(220),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppDimensions.widthCalculator(10)),
            child: GestureDetector(
              onTap: () => GoRouter.of(context).push(AppRouter.bookDetails),
              child: const CustomBookImage(),
            ),
          );
        },
      ),
    );
  }
}
