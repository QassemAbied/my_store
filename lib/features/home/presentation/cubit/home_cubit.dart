import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/use_case.dart';
import '../../domain/usecases/product_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductUseCase productUseCase;

  HomeCubit(this.productUseCase) : super(HomeInitial());


  Future getProduct() async{
    emit(ProductLoading());
    final result =await productUseCase(NoParams());
    result.result.fold((failure)=>emit(ProductFailure(failure.toString())),
        (data)=>emit(ProductSuccess(data)));

  }
}
