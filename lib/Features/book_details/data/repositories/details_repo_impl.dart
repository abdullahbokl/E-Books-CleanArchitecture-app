import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../domain/repositories/details_repo.dart';
import '../../domain/use_cases/fetch_similar_books_use_case.dart';
import '../data_sources/details_remote_data_sources.dart';

@LazySingleton(as: DetailsRepo)
class DetailsRepoImpl implements DetailsRepo {
  final DetailsRemoteDataSources _remoteDataSource;

  const DetailsRepoImpl(this._remoteDataSource);

  @override
  Future<Either<String, List<BookEntity>>> fetchSimilarBooks(
    FetchSimilarBooksParams params,
  ) async {
    try {
      final data = await _remoteDataSource.fetchSimilarBooks(params);
      List<BookEntity> books = convertDataIntoBooksList(data);
      return Right(books);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in fetchSimilarBooks: $e");
      return Left(e.toString());
    }
  }
}
