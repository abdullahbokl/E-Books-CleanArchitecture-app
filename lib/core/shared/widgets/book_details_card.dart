import 'package:flutter/material.dart';

import '../../../Features/home/presentation/widgets/book_rate.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';
import '../entities/book_entity/book_entity.dart';
import 'custom_book_image.dart';

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightCalculator(120),
      child: Row(
        children: [
          AspectRatio(
              aspectRatio: 1.5 / 2,
              child: CustomBookImage(imageUrl: book.image ?? '')),
          SizedBox(width: AppDimensions.widthCalculator(30)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: AppStyles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDimensions.heightCalculator(5)),
                Text(
                  book.authorName ?? '',
                  style: AppStyles.textStyle14,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      _priceText(),
                      style: AppStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    BookRate(
                      rate: book.rating,
                      rateCount: book.ratingCount,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.heightCalculator(5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _priceText() {
    var price = book.price;
    return price != null && price != 0 ? "$price EGP" : "Free";
  }
}
