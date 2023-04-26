import 'package:flutter/material.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/widgets/book_rate.dart';

class SearchBookDetailsCard extends StatelessWidget {
  const SearchBookDetailsCard({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightCalculator(120),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.5 / 2,
            child: CustomBookImage(imageUrl: book.image ?? ''),
          ),
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
