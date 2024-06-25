import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/base_app_exception.dart';
import '../../../../core/services/api/api_services.dart';
import '../../../../core/services/api/endpoints.dart';
import '../../domain/use_cases/fetch_all_books_use_case.dart';
import '../../domain/use_cases/fetch_newest_books_use_case.dart';

abstract class HomeRemoteDataSource {
  Future<dynamic> fetchAllBooks(
    FetchAllBooksParams params,
  );

  Future<dynamic> fetchNewestBooks(
    FetchNewestBooksParams params,
  );
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices _apiServices;

  const HomeRemoteDataSourceImpl(this._apiServices);

  @override
  Future<dynamic> fetchAllBooks(
    FetchAllBooksParams params,
  ) async {
    try {
      return await _apiServices.get(
        endPoint: EndPoints.books.fetchAllBooks,
        queryParameters: params.toMap(),
      );
    } on BaseAppException catch (e) {
      debugPrint("error in fetchAllBooks: $e");
      return e.message;
    }
  }

  @override
  Future<dynamic> fetchNewestBooks(
    FetchNewestBooksParams params,
  ) async {
    try {
      return await _apiServices.get(
        endPoint: EndPoints.books.fetchNewestBooks,
        queryParameters: params.toMap(),
      );
    } on BaseAppException catch (e) {
      debugPrint("error in fetchNewestBooks: $e");
      return e.message;
    }
  }
}
