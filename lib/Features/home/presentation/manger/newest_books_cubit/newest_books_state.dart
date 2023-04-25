part of 'newest_books_cubit.dart';

@immutable
abstract class FetchNewestBooksState {}

class FetchNewestBooksInitial extends FetchNewestBooksState {}

class FetchNewestBooksLoading extends FetchNewestBooksState {}

class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess(this.books);
}

class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errMessage;

  FetchNewestBooksFailure(this.errMessage);
}

