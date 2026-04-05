import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/core/network/dio_client.dart';
import 'package:my_store/core/network/use_case.dart';
import 'package:my_store/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:my_store/features/cart/domain/repository.dart';
import 'package:my_store/features/cart/domain/usecases/cart_item_use_case.dart';
import 'package:my_store/features/cart/domain/usecases/create_cart_use_case.dart';
import 'package:my_store/features/cart/domain/usecases/regions_use_case.dart';
import 'package:my_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source_impl.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';
import 'package:my_store/features/home/domain/usecases/product_usecase.dart';
import 'package:my_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_store/features/products/domain/repository.dart';
import 'package:my_store/features/products/domain/usecases/get_products_details.dart';
import 'package:my_store/features/products/presentation/cubit/product_details_cubit.dart';
import 'core/network/rest_client.dart';
import 'features/cart/data/data_source/cart_remote_data_source_impl.dart';
import 'features/cart/data/repository_impl.dart';
import 'features/home/data/repositories_impl/home_repositories_impl.dart';
import 'features/products/data/data_source/product_details_remote_data_source.dart';
import 'features/products/data/data_source/product_details_remote_data_source_impl.dart';
import 'features/products/data/repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => DioClient.getDio());
  sl.registerLazySingleton<RestClient>(() => RestClient(sl()));

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(restClient: sl()),
  );
  sl.registerLazySingleton<HomeRepositories>(() => HomeRepositoriesImpl(sl()));
  sl.registerLazySingleton<ProductUseCase>(() => ProductUseCase(sl()));
  sl.registerFactory(() => HomeCubit(sl()));


  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
        () => ProductDetailsRemoteDataSourceImpl( sl()),
  );
  sl.registerLazySingleton<ProductDetailsRepository>(() => ProductDetailsRepositoryImpl(sl()));
  sl.registerLazySingleton<GetProductsDetailsUseCase>(() => GetProductsDetailsUseCase(sl()));
  sl.registerFactory(() => ProductDetailsCubit(sl()));


  sl.registerLazySingleton<CartRemoteDataSource>(
        () => CartRemoteDataSourceImpl( sl()),
  );
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  sl.registerLazySingleton<CreateCartUseCase>(() => CreateCartUseCase(sl()));
  sl.registerLazySingleton<CartItemUseCase>(() => CartItemUseCase(sl()));
  sl.registerLazySingleton<RegionsUseCase>(() => RegionsUseCase(sl()));
  sl.registerFactory(() => CartCubit(sl(),sl(),sl(),));
}
