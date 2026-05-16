import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/ai/presentation/controller/ai_cubit.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller/theme_cubit.dart';
import 'core/theme/theme_controller/theme_state.dart';
import 'core/utils/constants.dart';
import 'core/utils/routing/app_route.dart';
import 'core/utils/routing/routers.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/bottom_nav_bar/controller/bottom_nav_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/category/presentation/controller/category_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CartCubit>()
            ..ensureCartId()
            ..getCartItems(),
        ),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => ThemeCubit()..init()),
        BlocProvider(create: (context) => sl<HomeCubit>()..getProduct()),
        BlocProvider(create: (context) => sl<AuthCubit>()..getProfile()),
        BlocProvider(create: (context) => sl<AiCubit>()),
        BlocProvider(
          create: (context) => sl<CategoryCubit>()..getCategories(context),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'My Store',
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: context.read<ThemeCubit>().themeMode(),
            onGenerateRoute: AppRoute.generateRoute,
            initialRoute: AppConstants.token == null || AppConstants.token == ''
                ? Routers.login
                : Routers.bottomNav,
          );
        },
      ),
    );
  }
}
