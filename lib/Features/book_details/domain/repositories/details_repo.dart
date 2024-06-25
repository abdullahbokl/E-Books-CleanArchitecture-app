import 'package:dartz/dartz.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../use_cases/fetch_similar_books_use_case.dart';

abstract class DetailsRepo {
  Future<Either<String, List<BookEntity>>> fetchSimilarBooks(
    FetchSimilarBooksParams params,
  );
}
