import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchAllBooks();

  Future<Either<Failure, List<BookEntity>>> fetchBestSellingBooks();
}

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call();
}
