import 'package:flutter/material.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/utils/dimensions.dart';
import '../widgets/book_actions.dart';
import '../widgets/book_details_custom_app_bar.dart';
import '../widgets/book_details_section.dart';
import '../widgets/similar_books_list_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

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
              BookDetailsSection(book: book),
              SizedBox(height: AppDimensions.heightCalculator(35)),
              BookActions(book: book),
              const Spacer(),
              SimilarBooksListView(book: book),
              SizedBox(height: AppDimensions.heightCalculator(20)),
            ],
          ),
        ),
      ),
    );
  }
}
