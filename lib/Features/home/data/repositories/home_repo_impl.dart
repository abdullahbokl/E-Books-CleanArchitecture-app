import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/shared/errors/failure.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_source/data_sources.dart';
import '../data_source/home_local_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<ServerFailure, List<BookEntity>>> fetchAllBooks() async {
    try {
      List<BookEntity> books = [];
      /// todo : uncomment this after implementing local data source
      // books = homeLocalDataSource.fetchAllBooks();
      // if (books.isNotEmpty) {
      //   return Right(books);
      // }
      books = await homeRemoteDataSource.fetchAllBooks();
      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books = [];
      /// todo : uncomment this after implementing local data source
      // books = homeLocalDataSource.fetchBestSellingBooks();
      // if (books.isNotEmpty) {
      //   return Right(books);
      // }
      books = await homeRemoteDataSource.fetchBestSellingBooks();
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
