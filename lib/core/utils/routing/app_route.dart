import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import '../../../features/address/presentation/controller/address_cubit.dart';
import '../../../features/address/presentation/screen/address_screen.dart';
import '../../../features/address/presentation/screen/address_settings/address_setting_screen.dart';
import '../../../features/auth/presentation/screens/create_user_profile/create_user_profile_screen.dart';
import '../../../features/auth/presentation/screens/login/login_screen.dart';
import '../../../features/auth/presentation/screens/profile/profile_screen.dart';
import '../../../features/auth/presentation/screens/register/register_screen.dart';
import '../../../features/bottom_nav_bar/page/bottom_navigation_bar.dart';
import '../../../features/cart/presentation/screens/cart/cart_screen.dart';
import '../../../features/orders/presentation/controller/order_cubit.dart';
import '../../../features/orders/presentation/screen/order_history/order_history_screen.dart';
import '../../../features/orders/presentation/screen/order_review/order_screen.dart';
import '../../../features/orders/presentation/screen/success/success_screen.dart';
import '../../../features/payment/presentation/controller/payment_cubit.dart';
import '../../../features/payment/presentation/screen/payment/payment_screen.dart';
import '../../../features/shipping/presentation/controller/shipping_cubit.dart';
import '../../../features/shipping/presentation/screen/shipping_screen.dart';
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
          return MaterialPageRoute(builder: (_) => const CartScreen());
        }
      case Routers.address:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<AddressCubit>()..getAddresses(),
                ),
                BlocProvider(create: (context) => sl<ShippingCubit>()),
              ],
              child: Builder(
                builder: (context) {
                  return AddressScreen();
                },
              ),
            ),
          );
        }
      case Routers.shipping:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<ShippingCubit>()..getShippingOptions(),
              child: ShippingScreen(),
            ),
          );
        }
      case Routers.profile:
        {
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(),
          );
        }
      case Routers.payment:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<PaymentCubit>(),
              child: PaymentScreen(),
            ),
          );
        }
      case Routers.success:
        {
          final orderId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => SuccessScreen(orderId: orderId),
          );
        }
      case Routers.orderHistory:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<OrderCubit>()..loadOrderList(),
              child: OrderHistoryScreen(),
            ),
          );
        }
      case Routers.orderReview:
        {
          final args = settings.arguments as Map;
          final orderId = args["orderId"] as String;
          final showButton = args["showButton"] as bool;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<OrderCubit>()..loadOrderReview(orderId),
              child: OrderReviewScreen(
                orderId: orderId,
                showButton: showButton,
              ),
            ),
          );
        }
      case Routers.addressSettings:
        {
          return MaterialPageRoute(
            builder: (_) => Builder(
              builder: (context) {
                return BlocProvider(
                  create: (context) => sl<AddressCubit>()..getAddresses(),
                  child: AddressSettingScreen(),
                );
              },
            ),
          );
        }
    }
    return null;
  }
}
