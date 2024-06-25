import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';
import '../repositories/home_repo.dart';

@lazySingleton
class FetchAllBooksUseCase
    implements UseCaseMethods<List<BookEntity>, FetchAllBooksParams> {
  final HomeRepo _homeRepo;

  const FetchAllBooksUseCase(this._homeRepo);

  @override
  Future<Either<String, List<BookEntity>>> call(
    FetchAllBooksParams params,
  ) async {
    return await _homeRepo.fetchAllBooks(params);
  }
}

class FetchAllBooksParams {
  final String query;
  final int limit;
  final int skip;
  final String orderBy;

  const FetchAllBooksParams({
    required this.query,
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
