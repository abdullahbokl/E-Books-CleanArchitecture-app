import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchBooksByQuery(String query);
}
