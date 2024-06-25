import 'package:dartz/dartz.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../use_cases/fetch_all_books_use_case.dart';
import '../use_cases/fetch_newest_books_use_case.dart';

abstract class HomeRepo {
  Future<Either<String, List<BookEntity>>> fetchAllBooks(
    FetchAllBooksParams params,
  );

  Future<Either<String, List<BookEntity>>> fetchNewestBooks(
    FetchNewestBooksParams params,
  );
}
