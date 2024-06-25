import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../../domain/use_cases/fetch_all_books_use_case.dart';
import '../../domain/use_cases/fetch_newest_books_use_case.dart';
import '../data_source/home_remote_data_source.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  const HomeRepoImpl(
    this._homeRemoteDataSource,
  );

  @override
  Future<Either<String, List<BookEntity>>> fetchAllBooks(
    FetchAllBooksParams params,
  ) async {
    try {
      final data = await _homeRemoteDataSource.fetchAllBooks(params);

      List<BookEntity> books = convertDataIntoBooksList(data);

      return Right(books);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in fetchAllBooks: $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BookEntity>>> fetchNewestBooks(
    FetchNewestBooksParams params,
  ) async {
    try {
      final data = await _homeRemoteDataSource.fetchNewestBooks(params);
      List<BookEntity> books = convertDataIntoBooksList(data);
      return Right(books);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in fetchNewestBooks: $e");
      return Left(e.toString());
    }
  }
}
