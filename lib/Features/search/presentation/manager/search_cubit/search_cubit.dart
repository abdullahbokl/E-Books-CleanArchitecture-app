import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../domain/use_cases/fetch_books_by_query_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final FetchBooksByQueryUseCase _fetchBooksByQueryUseCase;

  final TextEditingController searchFieldController = TextEditingController();

  SearchCubit(this._fetchBooksByQueryUseCase) : super(SearchInitial());

  List<BookEntity> books = [];

  fetchBooksBySearchQuery({
    bool isNewSearch = false,
    bool isDebounce = false,
  }) async {
    EasyDebounce.debounce(
      'search-books-debounce',
      Duration(milliseconds: isDebounce ? 500 : 0),
      () => _fetchBooksBySearchQuery(isNewSearch: isNewSearch),
    );
  }

  _fetchBooksBySearchQuery({bool isNewSearch = false}) async {
    if (isNewSearch) {
      books.clear();
    }
    emit(SearchLoading());
    var result = await _fetchBooksByQueryUseCase.call(FetchBooksByQueryParams(
      query: searchFieldController.text,
      skip: books.length,
    ));
    result.fold((failure) {
      emit(SearchFailure(failure));
    }, (value) {
      books.addAll(value);
      emit(SearchSuccess(value.isEmpty));
    });
  }
}
