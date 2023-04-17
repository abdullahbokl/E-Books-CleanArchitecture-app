import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import 'best_selling_item.dart';

class BestSellingListView extends StatelessWidget {
  const BestSellingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppDimensions.height20),
            child: const BestSellingListViewItem(),
          );
        },
      ),
    );
  }
}
