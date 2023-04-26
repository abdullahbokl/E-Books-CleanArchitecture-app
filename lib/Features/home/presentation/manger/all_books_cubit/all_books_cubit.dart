import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../domain/use_cases/fetch_all_books_use_case.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<FetchAllBooksState> {
  AllBooksCubit(this._fetchAllBooksUseCase) : super(FetchAllBooksInitial());

  static AllBooksCubit get(context) => BlocProvider.of(context);

  final FetchAllBooksUseCase _fetchAllBooksUseCase;

  Future<void> fetchAllBooks() async {
    emit(FetchAllBooksLoading());
    var result = await _fetchAllBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchAllBooksFailure(failure.message));
      },
      (books) {
        emit(FetchAllBooksSuccess(books));
      },
    );
  }
}
