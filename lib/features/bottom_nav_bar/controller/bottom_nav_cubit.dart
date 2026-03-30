

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());
  static BottomNavCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavIndex(int index) {
    currentIndex=index;
    emit(ChangeBottomNavIndex());
  }
}
