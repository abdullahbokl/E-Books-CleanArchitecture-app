import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../domain/use_cases/fetch_books_by_query_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchCubit(this._fetchBooksByQueryUseCase) : super(SearchInitial());

  final FetchBooksByQueryUseCase _fetchBooksByQueryUseCase;

  final TextEditingController searchFieldController = TextEditingController();

  fetchBooksBySearchQuery() async {
    emit(SearchLoading());
    var result =
        await _fetchBooksByQueryUseCase.call(searchFieldController.text);
    result.fold((failure) {
      emit(SearchFailure(failure.message));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
