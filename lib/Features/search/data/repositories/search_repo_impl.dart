import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../domain/repositories/search_repo.dart';
import '../../domain/use_cases/fetch_books_by_query_use_case.dart';
import '../data_sources/search_remote_data_source.dart';

@LazySingleton(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _searchRemoteDataSource;

  const SearchRepoImpl(this._searchRemoteDataSource);

  @override
  Future<Either<String, List<BookEntity>>> fetchBooksByQuery(
    FetchBooksByQueryParams params,
  ) async {
    try {
      final data = await _searchRemoteDataSource.fetchBooksByQuery(params);

      List<BookEntity> books = convertDataIntoBooksList(data);

      return Right(books);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in fetchBooksByQuery: $e");
      return Left(e.toString());
    }
  }
}
