import 'package:hive/hive.dart';

import '../../../../core/utils/strings.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchAllBooks();

  List<BookEntity> fetchBestSellingBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchAllBooks() {
    var box = Hive.box<BookEntity>(AppStrings.allBooksBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchBestSellingBooks() {
    var box = Hive.box<BookEntity>(AppStrings.bestSellerBox);
    return box.values.toList();
  }
}
