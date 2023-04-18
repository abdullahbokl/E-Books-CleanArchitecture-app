import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchAllBooks();

  List<BookEntity> fetchBestSellingBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchAllBooks() {
    // TODO: implement fetchAllBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchBestSellingBooks() {
    // TODO: implement fetchBestSellingBooks
    throw UnimplementedError();
  }
}
