import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<AppErrors, List<BookEntity>>> fetchAllBooks();

  Future<Either<AppErrors, List<BookEntity>>> fetchBestSellingBooks();
}

abstract class UseCase<Type, Param> {
  Future<Either<AppErrors, Type>> call(Param? param);
}
