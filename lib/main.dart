import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/core/theme/app_theme.dart';
import 'package:my_store/core/theme/theme_controller/theme_state.dart';
import 'package:my_store/core/utils/routing/app_route.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:my_store/features/category/presentation/controller/category_cubit.dart';
import 'package:my_store/features/home/presentation/cubit/home_cubit.dart';
import 'core/common_models/models/product_response_local_model.dart';
import 'core/utils/constants.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/bottom_nav_bar/controller/bottom_nav_cubit.dart';
import 'package:my_store/core/theme/theme_controller/theme_cubit.dart';
import 'features/category/data/models/category_local_model.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 Hive.registerAdapter(ProductResponseLocalModelAdapter());
  Hive.registerAdapter(ProductItemModelsAdapter());
  Hive.registerAdapter(VariantModelAdapter());
  Hive.registerAdapter(CalculatedPriceModelAdapter());
 await  Hive.openBox<ProductResponseLocalModel>(AppConstants.productLocalKey);
  Hive.registerAdapter(CategoryResponseLocalModelAdapter());
  Hive.registerAdapter(CategoryLocalModelAdapter());
  await  Hive.openBox<CategoryResponseLocalModel>(AppConstants.categoryLocalKey);
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey =dotenv.env['STRIPE_PUBLISHABLE_KEY']!;

//Hive.box<ProductResponseLocalModel>(
    //  AppConstants.productLocalKey).clear();
 // Hive.box<CategoryResponseLocalModel>(AppConstants.categoryLocalKey).clear();
  await Stripe.instance.applySettings();
  await SharedPrefHelper.init();
  if (kDebugMode) {
    print(AppConstants.token);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CartCubit>()..ensureCartId()..getCartItems()),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => ThemeCubit()..init()),
        BlocProvider(create: (context) => sl<HomeCubit>()..getProduct()),
        BlocProvider(create: (context) => sl<AuthCubit>()..getProfile()),
        BlocProvider(create: (context) => sl<CategoryCubit>()..getCategories(context)),

      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'My Store',
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: context.read<ThemeCubit>().themeMode(),
            onGenerateRoute: AppRoute.generateRoute,
            initialRoute: AppConstants.token == null ||
                AppConstants.token == ''
                ? Routers.login
                : Routers.bottomNav,
          );
        },
      ),
    );
  }
}
