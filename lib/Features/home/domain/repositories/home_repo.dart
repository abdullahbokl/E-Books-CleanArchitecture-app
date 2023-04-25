import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchAllBooks();

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}