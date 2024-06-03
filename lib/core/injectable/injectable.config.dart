// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import '../../feature/news_feature/data/data_source/remote_data_source/news_remote_data_source.dart'
    as _i4;
import '../../feature/news_feature/data/repository_impl/news_repository_impl.dart'
    as _i9;
import '../../feature/news_feature/domain/repository/news_repository.dart'
    as _i8;
import '../../feature/news_feature/domain/usecase/news_usecase.dart' as _i10;
import '../../feature/news_feature/presentation/controller/change_mark_in_latest_controller.dart'
    as _i5;
import '../../feature/news_feature/presentation/cubit/fetch_details_news_cubit/fetch_details_news_cubit.dart'
    as _i13;
import '../../feature/news_feature/presentation/cubit/fetch_featured_news_cubit/fetch_featured_news_cubit.dart'
    as _i11;
import '../../feature/news_feature/presentation/cubit/fetch_latest_news_cubit/fetch_latest_news_cubit.dart'
    as _i12;
import '../network/internet_connection_checker.dart' as _i14;
import '../network/network_info.dart' as _i6;
import '../network/network_info_impl.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModuleConnectionChecker = _$RegisterModuleConnectionChecker();
  gh.factory<_i3.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i4.NewsRemoteDataSource>(() => _i4.NewsRemoteDataSource());
  gh.lazySingleton<_i5.ChangeMarkInLatestController>(
      () => _i5.ChangeMarkInLatestController());
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i7.NetworkInfoImpl(gh<_i3.InternetConnectionChecker>()));
  gh.lazySingleton<_i8.NewsRepository>(() => _i9.NewsRepositoryImpl(
        gh<_i4.NewsRemoteDataSource>(),
        gh<_i6.NetworkInfo>(),
      ));
  gh.lazySingleton<_i10.NewsUsecase>(
      () => _i10.NewsUsecase(gh<_i8.NewsRepository>()));
  gh.lazySingleton<_i11.FetchFeaturedNewsCubit>(
      () => _i11.FetchFeaturedNewsCubit(gh<_i10.NewsUsecase>()));
  gh.lazySingleton<_i12.FetchLatestNewsCubit>(
      () => _i12.FetchLatestNewsCubit(gh<_i10.NewsUsecase>()));
  gh.lazySingleton<_i13.FetchDetailsNewsCubit>(
      () => _i13.FetchDetailsNewsCubit(gh<_i10.NewsUsecase>()));
  return getIt;
}

class _$RegisterModuleConnectionChecker
    extends _i14.RegisterModuleConnectionChecker {}
