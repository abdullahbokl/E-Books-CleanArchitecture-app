import '../shared/entities/book_entity/book_entity.dart';
import '../shared/models/book_model/book_model.dart';

List<BookEntity> convertDataIntoBooksList(data) {
  List<BookEntity> books = [];

  final booksData = data['items'] ?? [];
  for (var book in booksData) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}
