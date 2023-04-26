import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
