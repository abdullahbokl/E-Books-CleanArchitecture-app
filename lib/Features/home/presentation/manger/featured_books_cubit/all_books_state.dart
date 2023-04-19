part of 'all_books_cubit.dart';

@immutable
abstract class FetchAllBooksState {}

class FetchAllBooksInitial extends FetchAllBooksState {}

class FetchAllBooksLoading extends FetchAllBooksState {}

class FetchAllBooksFailure extends FetchAllBooksState {
  final String errMessage;

  FetchAllBooksFailure(this.errMessage);
}

class FetchAllBooksSuccess extends FetchAllBooksState {
  final List<BookEntity> books;

  FetchAllBooksSuccess(this.books);
}
