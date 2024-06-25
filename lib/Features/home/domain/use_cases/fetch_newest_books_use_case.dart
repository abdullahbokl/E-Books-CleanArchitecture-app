import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';
import '../repositories/home_repo.dart';

@lazySingleton
class FetchNewestBooksUseCase
    implements UseCaseMethods<List<BookEntity>, FetchNewestBooksParams> {
  final HomeRepo _homeRepo;

  const FetchNewestBooksUseCase(this._homeRepo);

  @override
  Future<Either<String, List<BookEntity>>> call(
    FetchNewestBooksParams params,
  ) async {
    return await _homeRepo.fetchNewestBooks(params);
  }
}

class FetchNewestBooksParams {
  final String query;
  final int limit;
  final int skip;
  final String orderBy;

  const FetchNewestBooksParams({
    this.query = 'all',
    this.limit = 10,
    this.skip = 0,
    this.orderBy = 'newest',
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
