import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';
import '../repositories/search_repo.dart';

class FetchBooksByQueryUseCase
    implements UseCaseMethods<List<BookEntity>, String> {
  FetchBooksByQueryUseCase(this.searchRepo);

  final SearchRepo searchRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? query]) {
    return searchRepo.fetchBooksByQuery(query ?? '');
  }
}
