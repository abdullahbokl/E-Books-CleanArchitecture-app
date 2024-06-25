import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';
import '../repositories/details_repo.dart';

@lazySingleton
class FetchSimilarBooksUseCase
    implements UseCaseMethods<List<BookEntity>, FetchSimilarBooksParams> {
  const FetchSimilarBooksUseCase(this._detailsRepo);

  final DetailsRepo _detailsRepo;

  @override
  Future<Either<String, List<BookEntity>>> call(
    FetchSimilarBooksParams params,
  ) async {
    return await _detailsRepo.fetchSimilarBooks(params);
  }
}

class FetchSimilarBooksParams {
  final String query;
  final int limit;
  final int skip;
  final String orderBy;

  const FetchSimilarBooksParams({
    this.query = 'all',
    this.limit = 10,
    this.skip = 0,
    this.orderBy = 'relevance',
  });

  // to map
  Map<String, dynamic> toMap() {
    return {
      'q': query,
      'maxResults': limit,
      'startIndex': skip,
      'orderBy': orderBy,
    };
  }
}
