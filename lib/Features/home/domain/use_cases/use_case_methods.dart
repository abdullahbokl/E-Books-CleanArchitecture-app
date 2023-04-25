import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call();
}
