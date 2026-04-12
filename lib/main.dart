import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/core/theme/app_theme.dart';
import 'package:my_store/core/theme/theme_controller/theme_state.dart';
import 'package:my_store/core/utils/routing/app_route.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:my_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_store/features/products/presentation/cubit/product_details_cubit.dart';
import 'core/utils/constants.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/bottom_nav_bar/controller/bottom_nav_cubit.dart';
import 'package:my_store/core/theme/theme_controller/theme_cubit.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await SharedPrefHelper.init();
  print(AppConstants.token);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),

        BlocProvider(create: (context) => ThemeCubit()..init()),
        BlocProvider(create: (context) => sl<ProductDetailsCubit>()),
        BlocProvider(create: (context) => sl<CartCubit>()),
        BlocProvider(create: (context) => sl<HomeCubit>()),
        BlocProvider(create: (context) => sl<AuthCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'My Store',
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: context.read<ThemeCubit>().themeMode(),
            onGenerateRoute: AppRoute.generateRoute,
            initialRoute: AppConstants.token== null||AppConstants.token == ''?
            Routers.login:Routers.bottomNav,
          );
        },
      ),
    );
  }
}
