import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors.dart';
import '../entities/book_entity.dart';
import '../repositories/home_repo.dart';

class FetchAllBooks implements UseCase<List<BookEntity>, void> {
  HomeRepo homeRepo;

  FetchAllBooks(this.homeRepo);

  @override
  Future<Either<AppErrors, List<BookEntity>>> call(_) async {
    return await homeRepo.fetchAllBooks();
  }
}