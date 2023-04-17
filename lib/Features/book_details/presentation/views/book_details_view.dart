import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../widgets/book_actions.dart';
import '../widgets/book_details_custom_app_bar.dart';
import '../widgets/book_details_section.dart';
import '../widgets/similar_books_list_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.widthCalculator(20)),
          child: Column(
            children: [
              const BookDetailsCustomAppBar(),
              SizedBox(height: AppDimensions.heightCalculator(10)),
              const BookDetailsSection(),
              SizedBox(height: AppDimensions.heightCalculator(35)),
              const BookActions(),
              const Spacer(),
              const SimilarBooksListView(),
              SizedBox(height: AppDimensions.heightCalculator(20)),
            ],
          ),
        ),
      ),
    );
  }
}
