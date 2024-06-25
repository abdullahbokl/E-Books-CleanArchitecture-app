// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Features/book_details/data/data_sources/details_remote_data_sources.dart'
    as _i6;
import '../../Features/book_details/data/repositories/details_repo_impl.dart'
    as _i8;
import '../../Features/book_details/domain/repositories/details_repo.dart'
    as _i7;
import '../../Features/book_details/domain/use_cases/fetch_similar_books_use_case.dart'
    as _i9;
import '../../Features/home/data/data_source/home_remote_data_source.dart'
    as _i10;
import '../../Features/home/data/repositories/home_repo_impl.dart' as _i12;
import '../../Features/home/domain/repositories/home_repo.dart' as _i11;
import '../../Features/home/domain/use_cases/fetch_all_books_use_case.dart'
    as _i16;
import '../../Features/home/domain/use_cases/fetch_newest_books_use_case.dart'
    as _i18;
import '../../Features/search/data/data_sources/search_remote_data_source.dart'
    as _i13;
import '../../Features/search/data/repositories/search_repo_impl.dart' as _i15;
import '../../Features/search/domain/repositories/search_repo.dart' as _i14;
import '../../Features/search/domain/use_cases/fetch_books_by_query_use_case.dart'
    as _i17;
import '../services/api/api_services.dart' as _i4;
import '../services/api/dio/dio_services.dart' as _i5;
import 'services_locator.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dio);
    gh.lazySingleton<_i4.ApiServices>(() => _i5.DioServices(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.DetailsRemoteDataSources>(
        () => _i6.DetailsRemoteDataSourcesImpl(gh<_i4.ApiServices>()));
    gh.lazySingleton<_i7.DetailsRepo>(
        () => _i8.DetailsRepoImpl(gh<_i6.DetailsRemoteDataSources>()));
    gh.lazySingleton<_i9.FetchSimilarBooksUseCase>(
        () => _i9.FetchSimilarBooksUseCase(gh<_i7.DetailsRepo>()));
    gh.lazySingleton<_i10.HomeRemoteDataSource>(
        () => _i10.HomeRemoteDataSourceImpl(gh<_i4.ApiServices>()));
    gh.lazySingleton<_i11.HomeRepo>(
        () => _i12.HomeRepoImpl(gh<_i10.HomeRemoteDataSource>()));
    gh.lazySingleton<_i13.SearchRemoteDataSource>(
        () => _i13.SearchRemoteDataSourceImpl(gh<_i4.ApiServices>()));
    gh.lazySingleton<_i14.SearchRepo>(
        () => _i15.SearchRepoImpl(gh<_i13.SearchRemoteDataSource>()));
    gh.lazySingleton<_i16.FetchAllBooksUseCase>(
        () => _i16.FetchAllBooksUseCase(gh<_i11.HomeRepo>()));
    gh.lazySingleton<_i17.FetchBooksByQueryUseCase>(
        () => _i17.FetchBooksByQueryUseCase(gh<_i14.SearchRepo>()));
    gh.lazySingleton<_i18.FetchNewestBooksUseCase>(
        () => _i18.FetchNewestBooksUseCase(gh<_i11.HomeRepo>()));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
