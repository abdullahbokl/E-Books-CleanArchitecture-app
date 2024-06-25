import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/shared/widgets/custom_circular_indicator.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import '../manger/all_books_cubit/all_books_cubit.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightCalculator(220),
      child: BlocBuilder<AllBooksCubit, FetchAllBooksState>(
        builder: (context, state) {
          if (state is FetchAllBooksSuccess) {
            return _booksList(state.books);
          } else if (state is FetchAllBooksFailure) {
            return ErrorWidget(state.errMessage);
          } else {
            return const CustomCircularIndicator();
          }
        },
      ),
    );
  }

  ListView _booksList(List<BookEntity> books) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: AppDimensions.widthCalculator(10)),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).push(
              AppRouter.bookDetails,
              extra: books[index],
            ),
            child: CustomBookImage(
              imageUrl: books[index].image ?? '',
            ),
          ),
        );
      },
    );
  }
}
