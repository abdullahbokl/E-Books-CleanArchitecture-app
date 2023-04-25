import 'package:boklo_ebook/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/book_details_card.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/custom_search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.widthCalculator(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimensions.heightCalculator(15)),
              const CustomSearchTextField(),
              SizedBox(height: AppDimensions.heightCalculator(15)),
              Text(
                'Search Result',
                style: AppStyles.textStyle18,
              ),
              SizedBox(height: AppDimensions.heightCalculator(15)),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: AppDimensions.heightCalculator(20)),
                      child: BookDetailsCard(
                        book: BookEntity(
                          bookId: '1',
                          title: 'title',
                          image: '',
                          authorName: '',
                          price: null,
                          rating: null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
