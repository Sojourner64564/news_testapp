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
    as _i5;
import '../../feature/news_feature/data/repository_impl/news_repository_impl.dart'
    as _i10;
import '../../feature/news_feature/domain/repository/news_repository.dart'
    as _i9;
import '../../feature/news_feature/domain/usecase/news_usecase.dart' as _i11;
import '../../feature/news_feature/presentation/controller/change_mark_in_latest_controller.dart'
    as _i6;
import '../../feature/news_feature/presentation/cubit/fetch_details_news_cubit/fetch_details_news_cubit.dart'
    as _i12;
import '../../feature/news_feature/presentation/cubit/fetch_featured_news_cubit/fetch_featured_news_cubit.dart'
    as _i13;
import '../../feature/news_feature/presentation/cubit/fetch_latest_news_cubit/fetch_latest_news_cubit.dart'
    as _i14;
import '../network/internet_connection_checker.dart' as _i15;
import '../network/network_info.dart' as _i7;
import '../network/network_info_impl.dart' as _i8;
import '../route/route.dart' as _i4;

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
  gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
  gh.lazySingleton<_i5.NewsRemoteDataSource>(() => _i5.NewsRemoteDataSource());
  gh.lazySingleton<_i6.ChangeMarkInLatestController>(
      () => _i6.ChangeMarkInLatestController());
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(gh<_i3.InternetConnectionChecker>()));
  gh.lazySingleton<_i9.NewsRepository>(() => _i10.NewsRepositoryImpl(
        gh<_i5.NewsRemoteDataSource>(),
        gh<_i7.NetworkInfo>(),
      ));
  gh.lazySingleton<_i11.NewsUsecase>(
      () => _i11.NewsUsecase(gh<_i9.NewsRepository>()));
  gh.lazySingleton<_i12.FetchDetailsNewsCubit>(
      () => _i12.FetchDetailsNewsCubit(gh<_i11.NewsUsecase>()));
  gh.lazySingleton<_i13.FetchFeaturedNewsCubit>(
      () => _i13.FetchFeaturedNewsCubit(gh<_i11.NewsUsecase>()));
  gh.lazySingleton<_i14.FetchLatestNewsCubit>(
      () => _i14.FetchLatestNewsCubit(gh<_i11.NewsUsecase>()));
  return getIt;
}

class _$RegisterModuleConnectionChecker
    extends _i15.RegisterModuleConnectionChecker {}
