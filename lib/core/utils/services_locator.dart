import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/data_source/home_local_data_source.dart';
import '../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../Features/home/data/repositories/home_repo_impl.dart';
import '../../Features/home/domain/use_cases/fetch_all_books_use_case.dart';
import '../../Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'api_services.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(
      getIt<ApiServices>(),
    ),
  );
  getIt.registerSingleton<HomeLocalDataSourceImpl>(
    HomeLocalDataSourceImpl(),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt<HomeRemoteDataSourceImpl>(),
      getIt<HomeLocalDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<FetchAllBooksUseCase>(
    FetchAllBooksUseCase(
      getIt<HomeRepoImpl>(),
    ),
  );
  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(
      getIt<HomeRepoImpl>(),
    ),
  );
}
