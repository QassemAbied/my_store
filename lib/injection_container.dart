import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/core/network/dio_client.dart';
import 'package:my_store/features/address/data/data_source/remote_data_source.dart';
import 'package:my_store/features/address/domain/repository.dart';
import 'package:my_store/features/address/presentation/controller/address_cubit.dart';
import 'package:my_store/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:my_store/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:my_store/features/auth/domain/repository.dart';
import 'package:my_store/features/auth/domain/usecases/get_profile_use_case.dart';
import 'package:my_store/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:my_store/features/auth/domain/usecases/register_auth_use_case.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:my_store/features/cart/domain/repository.dart';
import 'package:my_store/features/cart/domain/usecases/add_cart_use_case.dart';
import 'package:my_store/features/cart/domain/usecases/cart_item_use_case.dart';
import 'package:my_store/features/cart/domain/usecases/create_cart_use_case.dart';
import 'package:my_store/features/cart/domain/usecases/regions_use_case.dart';
import 'package:my_store/features/cart/domain/usecases/update_cart_use_case.dart';
import 'package:my_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:my_store/features/category/data/data_source/category_remote_data_source.dart';
import 'package:my_store/features/category/domain/category_repositories.dart';
import 'package:my_store/features/category/domain/usecases/get_category_use_case.dart';
import 'package:my_store/features/category/presentation/controller/category_cubit.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source_impl.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';
import 'package:my_store/features/home/domain/usecases/product_usecase.dart';
import 'package:my_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_store/features/orders/data/data_source/order_remote_data_source.dart';
import 'package:my_store/features/orders/domain/repository.dart';
import 'package:my_store/features/orders/presentation/controller/order_cubit.dart';
import 'package:my_store/features/products/domain/repository.dart';
import 'package:my_store/features/products/domain/usecases/get_products_details.dart';
import 'package:my_store/features/products/presentation/cubit/product_details_cubit.dart';
import 'package:my_store/features/shipping/data/data_source/remote_data_source.dart';
import 'core/network/rest_client.dart';
import 'core/services/stripe_service.dart';
import 'features/address/data/data_source/remote_data_source_impl.dart';
import 'features/address/data/repository_impl.dart';
import 'features/auth/data/repository_impl.dart';
import 'features/auth/domain/usecases/register_use_case.dart';
import 'features/cart/data/data_source/cart_remote_data_source_impl.dart';
import 'features/cart/data/repository_impl.dart';
import 'features/address/domain/ues_case/add_address_use_case.dart';
import 'features/category/data/category_repositories_impl.dart';
import 'features/category/data/data_source/category_remote_data_source_imp.dart';
import 'features/category/domain/usecases/get_product_by_category_use_case.dart';
import 'features/orders/data/data_source/order_remote_data_source_impl.dart';
import 'features/orders/data/repository_imp.dart';
import 'features/orders/domain/use_case/order_review_use_case.dart';
import 'features/payment/data/data_source/remote_payment_data_source.dart';
import 'features/payment/data/data_source/remote_payment_data_source_impl.dart';
import 'features/payment/data/repository_impl.dart';
import 'features/payment/domain/repository.dart';
import 'features/payment/domain/use_case/complete_order_use_case.dart';
import 'features/payment/domain/use_case/payment_collection_use_case.dart';
import 'features/payment/domain/use_case/payment_provider_use_case.dart';
import 'features/payment/domain/use_case/payment_session_use_case.dart';
import 'features/payment/presentation/controller/payment_cubit.dart';
import 'features/shipping/data/data_source/remote_data_source_impl.dart';
import 'features/shipping/data/repository_impl.dart';
import 'features/address/domain/ues_case/delete_address_use_case.dart';
import 'features/cart/domain/usecases/delete_cart_use_case.dart';
import 'features/address/domain/ues_case/get_address_use_case.dart';
import 'features/home/data/repositories_impl/home_repositories_impl.dart';
import 'features/products/data/data_source/product_details_remote_data_source.dart';
import 'features/products/data/data_source/product_details_remote_data_source_impl.dart';
import 'features/products/data/repository_impl.dart';
import 'features/shipping/domain/repository.dart';
import 'features/shipping/domain/ues_case/add_shipping_address_use_case.dart';
import 'features/shipping/domain/ues_case/add_shipping_use_cas.dart';
import 'features/shipping/domain/ues_case/shipping_use_case.dart';
import 'features/shipping/presentation/controller/shipping_cubit.dart';

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
    () => ProductDetailsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<GetProductsDetailsUseCase>(
    () => GetProductsDetailsUseCase(sl()),
  );
  sl.registerFactory(() => ProductDetailsCubit(sl()));

  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  sl.registerLazySingleton<CreateCartUseCase>(() => CreateCartUseCase(sl()));
  sl.registerLazySingleton<CartItemUseCase>(() => CartItemUseCase(sl()));
  sl.registerLazySingleton<RegionsUseCase>(() => RegionsUseCase(sl()));
  sl.registerLazySingleton<AddCartUseCase>(() => AddCartUseCase(sl()));
  sl.registerLazySingleton<DeleteCartUseCase>(() => DeleteCartUseCase(sl()));
  sl.registerLazySingleton<UpdateCartUseCase>(() => UpdateCartUseCase(sl()));

  sl.registerFactory(() => CartCubit(sl(), sl(), sl(), sl(), sl(), sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<RegisterAuthUseCase>(
    () => RegisterAuthUseCase(sl()),
  );
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<LoginUserUseCase>(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));

  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl()));

  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<GetAddressUseCase>(() => GetAddressUseCase(sl()));
  sl.registerLazySingleton<DeleteAddressUseCase>(
    () => DeleteAddressUseCase(sl()),
  );
  sl.registerLazySingleton<AddAddressUseCase>(() => AddAddressUseCase(sl()));
  sl.registerFactory(() => AddressCubit(sl(), sl(), sl()));

  sl.registerLazySingleton<ShippingRemoteDataSource>(
    () => ShippingRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ShippingRepository>(
    () => ShippingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<AddShippingAddressUseCase>(
    () => AddShippingAddressUseCase(sl()),
  );
  sl.registerLazySingleton<AddShippingUseCas>(() => AddShippingUseCas(sl()));
  sl.registerLazySingleton<ShippingUseCase>(() => ShippingUseCase(sl()));
  sl.registerFactory(() => ShippingCubit(sl(), sl(), sl()));

  sl.registerLazySingleton(() => StripeService());

  sl.registerLazySingleton<RemotePaymentDataSource>(
    () => RemotePaymentDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => CreatePaymentCollectionUseCase(sl()));
  sl.registerLazySingleton(() => PaymentProviderUseCase(sl()));
  sl.registerLazySingleton(() => CompleteOrderUseCase(sl()));
  sl.registerLazySingleton(() => PaymentSessionUseCase(sl()));
  sl.registerFactory(() => PaymentCubit(sl(), sl(), sl(), sl(), sl()));

  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(sl()));
  sl.registerLazySingleton<OrderReviewUseCase>(() => OrderReviewUseCase(sl()));
  sl.registerFactory(() => OrderCubit(sl()));



  sl.registerLazySingleton<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CategoryRepositories>(
        () => CategoryRepositoriesImpl(sl()),
  );
  sl.registerLazySingleton(() => GetCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetProductsByCategoryUseCase(sl()));
  sl.registerFactory(() => CategoryCubit(sl(),sl(),));
}
