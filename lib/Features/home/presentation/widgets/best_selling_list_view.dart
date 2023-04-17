import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import 'best_selling_item.dart';

class BestSellingListView extends StatelessWidget {
  const BestSellingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppDimensions.heightCalculator(20)),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).push(AppRouter.bookDetails),
            child: const BestSellingListViewItem(),
          ),
        );
      },
    );
  }
}
