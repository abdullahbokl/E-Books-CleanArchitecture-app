import 'package:boklo_ebook/Features/home/presentation/widgets/book_rate.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/book_details_custom_app_bar.dart';

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
              SizedBox(
                  width: AppDimensions.widthCalculator(200),
                  child: const CustomBookImage()),
              SizedBox(height: AppDimensions.heightCalculator(45)),
              Text(
                'The Jungle Book',
                style: AppStyles.textStyle30.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.heightCalculator(5)),
              Opacity(
                opacity: .7,
                child: Text(
                  'Rudyard Kipling',
                  style: AppStyles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.heightCalculator(18)),
              const BookRate(),
            ],
          ),
        ),
      ),
    );
  }
}
