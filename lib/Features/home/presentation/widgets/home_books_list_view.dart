import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import 'custom_list_view_item.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height220,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppDimensions.width10),
            child: const CustomListViewItem(),
          );
        },
      ),
    );
  }
}
