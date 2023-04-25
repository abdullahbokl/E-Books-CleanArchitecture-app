import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchAllBooks();

  Future<List<BookEntity>> fetchBestSellingBooks();
}
