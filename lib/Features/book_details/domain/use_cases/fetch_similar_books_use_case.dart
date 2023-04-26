import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';
import '../repositories/details_repo.dart';

class FetchSimilarBooksUseCase
    implements UseCaseMethods<List<BookEntity>, String> {
  FetchSimilarBooksUseCase(this.detailsRepo);

  final DetailsRepo detailsRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? category]) async {
    return await detailsRepo.fetchSimilarBooks(category: category ?? '');
  }
}
