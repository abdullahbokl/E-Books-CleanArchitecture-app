import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/shared/widgets/custom_circular_indicator.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/utils/styles.dart';
import '../manager/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.categories?.first ?? 'programming');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: AppStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(15)),
        SizedBox(
          height: AppDimensions.heightCalculator(100),
          child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              if (state is SimilarBooksSuccess) {
                return _similarBooksListView(state.books);
              } else if (state is SimilarBooksFailure) {
                return ErrorWidget(state.errMessage);
              } else {
                return const CustomCircularIndicator();
              }
            },
          ),
        ),
      ],
    );
  }

  _similarBooksListView(List<BookEntity> books) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: AppDimensions.widthCalculator(5)),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).push(
              AppRouter.bookDetails,
              extra: books[index],
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CustomBookImage(
                imageUrl: books[index].image ?? '',
              ),
            ),
          ),
        );
      },
    );
  }
}
