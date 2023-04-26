import '../shared/entities/book_entity/book_entity.dart';
import '../shared/models/book_model/book_model.dart';

List<BookEntity> convertDataIntoBooksList(data) {
  List<BookEntity> books = [];

  for (var book in data['items']) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}
