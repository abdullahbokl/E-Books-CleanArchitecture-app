import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repositories/home_repo.dart';

class FetchAllBooksUseCase implements UseCase<List<BookEntity>, void> {
  HomeRepo homeRepo;

  FetchAllBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchAllBooks();
  }
}
