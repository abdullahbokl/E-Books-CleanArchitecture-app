import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/utils/dimensions.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.symmetric(vertical: AppDimensions.heightCalculator(5)),
          child: CustomBookImage(imageUrl: ''),
        );
      },
    );
  }
}
