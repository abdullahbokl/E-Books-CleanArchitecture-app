part of 'best_selling_books_cubit.dart';

@immutable
abstract class FetchBestSellingBooksState {}

class FetchBestSellingBooksInitial extends FetchBestSellingBooksState {}

class FetchBestSellingBooksLoading extends FetchBestSellingBooksState {}

class FetchBestSellingBooksSuccess extends FetchBestSellingBooksState {
  final List<BookEntity> books;

  FetchBestSellingBooksSuccess(this.books);
}

class FetchBestSellingBooksFailure extends FetchBestSellingBooksState {
  final String errMessage;

  FetchBestSellingBooksFailure(this.errMessage);
}

