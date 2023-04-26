import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../home/presentation/widgets/book_rate.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppDimensions.widthCalculator(200),
          child: CustomBookImage(
            imageUrl: book.image ?? '',
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(45)),
        Text(
          book.title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(5)),
        Opacity(
          opacity: .7,
          child: Text(
            book.authorName ?? '',
            style: AppStyles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(18)),
        BookRate(
          rate: book.rating,
          rateCount: book.ratingCount,
        ),
      ],
    );
  }
}
