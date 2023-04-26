import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<FetchNewestBooksState> {
  NewestBooksCubit(this._fetchNewestBooksUseCase)
      : super(FetchNewestBooksInitial());

  static NewestBooksCubit get(context) => BlocProvider.of(context);
  final FetchNewestBooksUseCase _fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var result = await _fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(FetchNewestBooksFailure(failure.message));
    }, (books) {
      emit(FetchNewestBooksSuccess(books));
    });
  }
}
