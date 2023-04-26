import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';

abstract class UseCaseMethods<Type, Param> {
  Future<Either<Failure, Type>> call([Param? params]);
}

class NoParams {}