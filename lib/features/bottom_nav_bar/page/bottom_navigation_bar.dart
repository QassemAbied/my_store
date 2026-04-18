import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/bottom_nav_bar/controller/bottom_nav_state.dart';
import '../../../injection_container.dart';
import '../../cart/presentation/cubit/cart_cubit.dart';
import '../../cart/presentation/screens/cart/cart_screen.dart';
import '../../category/presentation/screens/category_screen.dart';
import '../../favorite/presentation/screens/favorite_screen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../settings/presentation/screens/settings_screen.dart';
import '../controller/bottom_nav_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {


  const CustomBottomNavigationBar({
    super.key,
    
  });
  static  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),

    FavoriteScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
  builder: (context, state) {
    return Scaffold(
      body: _screens[BottomNavCubit.get(context).currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: BottomNavCubit.get(context).currentIndex,
        onTap: (int index){
          BottomNavCubit.get(context).changeBottomNavIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  },
);
  }
}
