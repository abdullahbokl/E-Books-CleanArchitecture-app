import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  Future<Either<AppErrors, List<BookEntity>>> fetchAllBooks();

  Future<Either<AppErrors, List<BookEntity>>> fetchBestSellingBooks();
}


class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<Either<AppErrors, List<BookEntity>>> fetchAllBooks() {
    // TODO: implement fetchAllBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<AppErrors, List<BookEntity>>> fetchBestSellingBooks() {
    // TODO: implement fetchBestSellingBooks
    throw UnimplementedError();
  }



}