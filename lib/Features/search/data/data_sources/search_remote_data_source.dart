import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/base_app_exception.dart';
import '../../../../core/services/api/api_services.dart';
import '../../../../core/services/api/endpoints.dart';
import '../../domain/use_cases/fetch_books_by_query_use_case.dart';

abstract class SearchRemoteDataSource {
  Future<dynamic> fetchBooksByQuery(
    FetchBooksByQueryParams params,
  );
}

@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  const SearchRemoteDataSourceImpl(this._apiServices);

  final ApiServices _apiServices;

  @override
  Future<dynamic> fetchBooksByQuery(
    FetchBooksByQueryParams params,
  ) async {
    try {
      return await _apiServices.get(
        endPoint: EndPoints.books.fetchAllBooks,
        queryParameters: params.toMap(),
      );
    } on BaseAppException catch (e) {
      debugPrint("error in fetchBooksByQuery: $e");
      return e.message;
    }
  }
}
