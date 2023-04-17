import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/best_selling_list_view.dart';
import '../widgets/home_books_list_view.dart';
import '../widgets/home_custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.widthCalculator(20)),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.heightCalculator(20)),
                    const HomeCustomAppBar(),
                    SizedBox(height: AppDimensions.heightCalculator(30)),
                    const HomeBooksListView(),
                    SizedBox(height: AppDimensions.heightCalculator(50)),
                    Text('Best Selling', style: AppStyles.textStyle18),
                    SizedBox(height: AppDimensions.heightCalculator(20)),
                  ],
                ),
              ),
              const SliverFillRemaining(
                child: BestSellingListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
