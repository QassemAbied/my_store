import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/features/address/presentation/screen/address_screen.dart';
import 'package:my_store/features/auth/presentation/screens/create_user_profile/create_user_profile_screen.dart';
import 'package:my_store/features/auth/presentation/screens/login/login_screen.dart';
import 'package:my_store/features/bottom_nav_bar/page/bottom_navigation_bar.dart';
import 'package:my_store/features/cart/presentation/screens/cart/cart_screen.dart';
import 'package:my_store/features/cart/presentation/screens/payment/payment_screen.dart';
import 'package:my_store/features/shipping/presentation/controller/shipping_cubit.dart';
import 'package:my_store/features/shipping/presentation/screen/shipping_screen.dart';
import '../../../features/auth/presentation/screens/register/register_screen.dart';
import '../../../features/cart/domain/entities/params.dart';
import '../../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../../injection_container.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.register:
        {
          return MaterialPageRoute(builder: (_) => const RegisterScreen());
        }

      case Routers.login:
        {
          return MaterialPageRoute(builder: (_) => const LoginScreen());
        }
      case Routers.createProfile:
        {
          return MaterialPageRoute(
            builder: (_) => const CreateUserProfileScreen(),
          );
        }

      case Routers.bottomNav:
        {
          return MaterialPageRoute(
            builder: (_) => const CustomBottomNavigationBar(),
          );
        }
      case Routers.cart:
        {
          return MaterialPageRoute(
            builder: (_) => const CartScreen(),
          );
        }
      case Routers.address:
        {
          return MaterialPageRoute(
            builder: (_) => const AddressScreen(),
          );
        }
      case Routers.shipping:
        {
          return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => sl<ShippingCubit>()..getShippingOptions(),
                  child: ShippingScreen(),
                ),
          );
        }
      case Routers.payment:
        {
          return MaterialPageRoute(
            builder: (_) => const PaymentScreen(),
          );
        }
    }
    return null;
  }
}
