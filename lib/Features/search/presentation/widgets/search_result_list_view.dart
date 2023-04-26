import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import 'search_book_details_card.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).push(
            AppRouter.bookDetails,
            extra: books[index],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: AppDimensions.heightCalculator(20),
            ),
            child: SearchBookDetailsCard(
              book: books[index],
            ),
          ),
        );
      },
    );
  }
}
