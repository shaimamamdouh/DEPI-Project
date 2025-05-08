
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:readio/core/utils/api_service.dart';
import 'package:readio/data/data_sources/home_local_data_source.dart';
import 'package:readio/data/data_sources/home_remote_data_source.dart';
import 'package:readio/data/repository/home_repo_impl.dart';
final getIt= GetIt.instance;
void locatorService() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerFactory<HomeRepoImpl>(() => HomeRepoImpl(
              remoteDataSource: HomeRemoteDataSourceImpl(
                apiService: getIt<ApiService>(),
              ),
              localDataSource: HomeLocalDataSourceImpl(),
            ));
}