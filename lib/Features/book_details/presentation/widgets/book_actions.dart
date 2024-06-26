import 'package:flutter/material.dart';

import '../../../../core/functions/launch_url.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/widgets/custom_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimensions.dart';

class BookActions extends StatelessWidget {
  const BookActions({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensions.widthCalculator(20)),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text: _priceText(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.heightCalculator(16)),
                bottomLeft: Radius.circular(AppDimensions.heightCalculator(16)),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: AppColors.previewButtonColor,
              textColor: Colors.white,
              text: _buttonText(),
              fontSize: AppDimensions.heightCalculator(14),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppDimensions.heightCalculator(16)),
                bottomRight:
                    Radius.circular(AppDimensions.heightCalculator(16)),
              ),
              onPressed: () => launchCustomUrl(context, book.previewLink ?? ''),
            ),
          ),
        ],
      ),
    );
  }

  String _buttonText() {
    return book.previewLink == null ? "Not Available" : "Preview";
  }

  _priceText() {
    var price = book.price;
    return price != null && price != 0 ? "$price EGP" : "Free";
  }
}
