import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchAllBooks();

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}