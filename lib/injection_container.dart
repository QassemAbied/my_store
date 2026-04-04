import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/core/network/dio_client.dart';
import 'package:my_store/core/network/use_case.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source_impl.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';
import 'package:my_store/features/home/domain/usecases/product_usecase.dart';
import 'package:my_store/features/home/presentation/cubit/home_cubit.dart';
import 'core/network/rest_client.dart';
import 'features/home/data/repositories_impl/home_repositories_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => DioClient.getDio());
  sl.registerLazySingleton<RestClient>(() => RestClient(sl()));

  sl.registerLazySingleton<RemoteDataSource>(()=>RemoteDataSourceImpl(restClient: sl()));
 sl.registerLazySingleton<HomeRepositories>(()=>HomeRepositoriesImpl(sl()));
  sl.registerLazySingleton<ProductUseCase>(() => ProductUseCase(sl()));

 sl.registerFactory(()=>HomeCubit(sl()));
}
