import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/base_app_exception.dart';
import '../../../../core/services/api/api_services.dart';
import '../../../../core/services/api/endpoints.dart';
import '../../domain/use_cases/fetch_similar_books_use_case.dart';

abstract class DetailsRemoteDataSources {
  Future<dynamic> fetchSimilarBooks(FetchSimilarBooksParams params);
}

@LazySingleton(as: DetailsRemoteDataSources)
class DetailsRemoteDataSourcesImpl implements DetailsRemoteDataSources {
  final ApiServices _apiServices;

  const DetailsRemoteDataSourcesImpl(this._apiServices);

  @override
  Future<dynamic> fetchSimilarBooks(FetchSimilarBooksParams params) async {
    {
      try {
        return await _apiServices.get(
          endPoint: EndPoints.books.fetchSimilarBooks,
          queryParameters: params.toMap(),
        );
      } on BaseAppException catch (e) {
        debugPrint("error in fetchSimilarBooks: $e");
        return e.message;
      }
    }
  }
}
