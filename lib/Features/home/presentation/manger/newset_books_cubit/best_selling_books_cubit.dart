import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_best_selling_books_use_case.dart';

part 'best_selling_books_state.dart';

class BestSellingBooksCubit extends Cubit<FetchBestSellingBooksState> {
  BestSellingBooksCubit(this.fetchBestSellingBooksUseCase)
      : super(FetchBestSellingBooksInitial());

  static BestSellingBooksCubit get(context) => BlocProvider.of(context);

  FetchBestSellingBooksUseCase fetchBestSellingBooksUseCase;

  Future<void> fetchBestSellingBooks() async {
    emit(FetchBestSellingBooksLoading());
    var result = await fetchBestSellingBooksUseCase.call();
    result.fold((failure) {
      emit(FetchBestSellingBooksFailure(failure.message));
    }, (books) {
      emit(FetchBestSellingBooksSuccess(books));
    });
  }
}
