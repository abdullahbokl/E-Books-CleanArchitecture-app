import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/widgets/custom_circular_indicator.dart';
import '../../../../core/shared/widgets/custom_error_widget.dart';
import '../../../../core/shared/widgets/custom_paginated_list.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/utils/styles.dart';
import '../manager/search_cubit/search_cubit.dart';
import '../widgets/custom_search_text_field.dart';
import '../widgets/search_book_details_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final SearchCubit searchCubit;

  @override
  void initState() {
    searchCubit = context.read<SearchCubit>();
    searchCubit.fetchBooksBySearchQuery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.widthCalculator(15)),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: AppDimensions.heightCalculator(20)),
                    const CustomSearchTextField(),
                    SizedBox(height: AppDimensions.heightCalculator(15)),
                    Text(
                      'Search Result',
                      style: AppStyles.textStyle18,
                    ),
                    SizedBox(height: AppDimensions.heightCalculator(15)),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading && searchCubit.books.isEmpty) {
                      return const CustomCircularIndicator();
                    } else if (state is SearchFailure &&
                        searchCubit.books.isEmpty) {
                      return CustomErrorWidget(errorMessage: state.errMessage);
                    } else if (searchCubit.books.isEmpty) {
                      return const CustomErrorWidget(
                        errorMessage: 'No result found',
                      );
                    }
                    return CustomPaginatedList(
                      scrollController: ScrollController(),
                      items: searchCubit.books,
                      onLoadMore: () {
                        context.read<SearchCubit>().fetchBooksBySearchQuery();
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                              AppRouter.bookDetails,
                              extra: searchCubit.books[index],
                            );
                          },
                          child: SearchBookDetailsCard(
                            book: searchCubit.books[index],
                          ),
                        );
                      },
                      isLoading: state is SearchLoading,
                      hasReachedMax:
                          state is SearchSuccess ? state.hasReachedMax : false,
                    );
                    // return SearchResultListView(books: searchCubit.books);
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
