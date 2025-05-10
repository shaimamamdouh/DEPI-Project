
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:readio/core/utils/api_service.dart';
import 'package:readio/features/home/data/data_sources/home_local_data_source.dart';
import 'package:readio/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:readio/features/home/data/repository/home_repo_impl.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio()); // تسجيل Dio
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>())); // تمرير Dio لـ ApiService
  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl());
  getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(
    remoteDataSource: getIt.get<HomeRemoteDataSource>(),
    localDataSource: getIt.get<HomeLocalDataSource>(),
  ));
}