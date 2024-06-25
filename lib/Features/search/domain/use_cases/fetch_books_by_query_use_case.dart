import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';
import '../repositories/search_repo.dart';

@lazySingleton
class FetchBooksByQueryUseCase
    implements UseCaseMethods<List<BookEntity>, FetchBooksByQueryParams> {
  const FetchBooksByQueryUseCase(this._searchRepo);

  final SearchRepo _searchRepo;

  @override
  Future<Either<String, List<BookEntity>>> call(
    FetchBooksByQueryParams params,
  ) async {
    return await _searchRepo.fetchBooksByQuery(params);
  }
}

class FetchBooksByQueryParams {
  final String query;
  final int limit;
  final int skip;
  final String orderBy;

  const FetchBooksByQueryParams({
    this.query = 'all',
    this.limit = 10,
    this.skip = 0,
    this.orderBy = 'relevance',
  });

  // to map
  Map<String, dynamic> toMap() {
    return {
      'q': query.isEmpty ? 'all' : query,
      'maxResults': limit,
      'startIndex': skip,
      'orderBy': orderBy,
    };
  }
}
