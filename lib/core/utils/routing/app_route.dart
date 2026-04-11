import 'package:flutter/material.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'package:my_store/features/auth/presentation/screens/login/login_screen.dart';
import 'package:my_store/features/bottom_nav_bar/page/bottom_navigation_bar.dart';
import '../../../features/auth/presentation/screens/register/register_screen.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings){
    switch(settings.name) {
      case Routers.register:{
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      }

      case Routers.login:{
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      }

      case Routers.bottomNav:{
        return MaterialPageRoute(builder: (_) => const CustomBottomNavigationBar());

      }
    }
    return null;
  }
}