import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../domain/repositories/search_repo.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooksByQuery(query) async {
    try {
      List<BookEntity> books = [];
      books = await searchRemoteDataSource.fetchBooksByQuery(query);
      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
