import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../domain/repositories/details_repo.dart';
import '../data_sources/details_remote_data_sources.dart';

class DetailsRepoImpl implements DetailsRepo {
  DetailsRepoImpl(this.remoteDataSource);

  final DetailsRemoteDataSources remoteDataSource;

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      List<BookEntity> result =
          await remoteDataSource.fetchSimilarBooks(category);
      return Right(result);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
