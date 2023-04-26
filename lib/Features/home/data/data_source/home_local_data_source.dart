import 'package:hive/hive.dart';

import '../../../../core/utils/strings.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchAllBooks();

  List<BookEntity> fetchBestSellingBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchAllBooks() {
    var box = Hive.box(AppStrings.allBooksBox);
    var value = box.get(AppStrings.allBooksKey) as List<dynamic>;
    List<BookEntity> books = _convertListOfDynamicToListOfBookEntity(value);
    return books;
  }

  @override
  List<BookEntity> fetchBestSellingBooks() {
    var box = Hive.box(AppStrings.newestBooksBox);
    var value = box.get(AppStrings.newestBooksKey) as List<dynamic>;
    List<BookEntity> books = _convertListOfDynamicToListOfBookEntity(value);

    return books;
  }

  _convertListOfDynamicToListOfBookEntity(List<dynamic> value) {
    List<BookEntity> books = [];
    for (BookEntity item in value) {
      books.add(item);
    }
    return books;
  }
}
