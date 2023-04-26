import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../repositories/home_repo.dart';
import '../../../../core/shared/use_cases/use_case_methods.dart';

class FetchNewestBooksUseCase implements UseCaseMethods<List<BookEntity>, NoParams> {
  HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? params]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
