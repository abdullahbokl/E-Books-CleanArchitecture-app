import 'package:dartz/dartz.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../use_cases/fetch_books_by_query_use_case.dart';

abstract class SearchRepo {
  Future<Either<String, List<BookEntity>>> fetchBooksByQuery(
    FetchBooksByQueryParams params,
  );
}
