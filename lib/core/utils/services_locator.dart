import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/book_details/data/data_sources/details_remote_data_sources.dart';
import '../../Features/book_details/data/repositories/details_repo_impl.dart';
import '../../Features/book_details/domain/use_cases/fetch_similar_books_use_case.dart';
import '../../Features/home/data/data_source/home_local_data_source.dart';
import '../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../Features/home/data/repositories/home_repo_impl.dart';
import '../../Features/home/domain/use_cases/fetch_all_books_use_case.dart';
import '../../Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../Features/search/data/data_sources/search_remote_data_source.dart';
import '../../Features/search/data/repositories/search_repo_impl.dart';
import '../../Features/search/domain/use_cases/fetch_books_by_query_use_case.dart';
import '../services/api_services.dart';

GetIt getIt = GetIt.instance;

/// API Services
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );

  /// home
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
  // Home Use Cases
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

  /// Details
  getIt.registerSingleton<DetailsRemoteDataSourcesImpl>(
    DetailsRemoteDataSourcesImpl(
      getIt<ApiServices>(),
    ),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      getIt<DetailsRemoteDataSourcesImpl>(),
    ),
  );
  // Details Use Cases
  getIt.registerSingleton<FetchSimilarBooksUseCase>(
    FetchSimilarBooksUseCase(
      getIt<DetailsRepoImpl>(),
    ),
  );

  /// search
  getIt.registerSingleton<SearchRemoteDataSourceImpl>(
    SearchRemoteDataSourceImpl(
      getIt<ApiServices>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt<SearchRemoteDataSourceImpl>(),
    ),
  );
  // search use cases
  getIt.registerSingleton<FetchBooksByQueryUseCase>(
    FetchBooksByQueryUseCase(
      getIt<SearchRepoImpl>(),
    ),
  );
}
