import 'package:dartz/dartz.dart';

abstract class UseCaseMethods<Type, Param> {
  Future<Either<String, Type>> call(Param params);
}
