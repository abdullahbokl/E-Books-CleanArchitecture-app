import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repositories/home_repo.dart';

class FetchBestSellingBooksUseCase implements UseCase<List<BookEntity>, void> {
  HomeRepo homeRepo;

  FetchBestSellingBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchBestSellingBooks();
  }
}
