import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_source/home_local_data_source.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<AppErrors, List<BookEntity>>> fetchAllBooks() async {
    try {
      var localBooks = homeLocalDataSource.fetchAllBooks();
      if (localBooks.isNotEmpty) {
        return Right(localBooks);
      }
      var books = await homeRemoteDataSource.fetchAllBooks();
      return Right(books);
    } catch (error) {
      return Left(AppErrors());
    }
  }

  @override
  Future<Either<AppErrors, List<BookEntity>>> fetchBestSellingBooks() async {
    try {
      var localBooks = homeLocalDataSource.fetchBestSellingBooks();
      if (localBooks.isNotEmpty) {
        return Right(localBooks);
      }
      var books = await homeRemoteDataSource.fetchBestSellingBooks();
      return Right(books);
    } catch (error) {
      return Left(AppErrors());
    }
  }
}
