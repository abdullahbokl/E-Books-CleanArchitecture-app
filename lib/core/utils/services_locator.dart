import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../services/api/dio/dio_init.dart';
import 'services_locator.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.initGetIt();

@module
abstract class AppModule {
  // dio
  @lazySingleton
  Dio get dio => dioInit();
}
