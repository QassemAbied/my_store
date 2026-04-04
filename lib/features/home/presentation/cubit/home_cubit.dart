import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/home/domain/entities/product_entities.dart';
import 'package:my_store/features/home/domain/entities/product_param.dart';
import '../../domain/usecases/product_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductUseCase productUseCase;

  HomeCubit(this.productUseCase) : super(HomeInitial());

  int limit = 7;
   int offset = 0;
   bool hasMore = true;
   bool isLoading = false;

  List<ProductItemEntity> productList = [];


  Future getProduct({ bool isLoadMore=false}) async{
    if(isLoading || !hasMore) return;
    isLoading=true;
    if(!isLoadMore){
       offset = 0;
       hasMore = true;
       productList.clear();
       emit(ProductLoading());
    }


   final params=ProductParams(limit: limit, offset: offset, fields: "id,title,description,thumbnail");
    final result =await productUseCase(params);
    result.result.fold((failure)=>emit(ProductFailure(failure.toString())),
        (data){
      final newProduct = data.products;
      if(newProduct?.isEmpty??false){
        hasMore=false;
      }else{
        productList.addAll(newProduct!);
        offset+=limit;
      }
      emit(ProductSuccess(product: productList,));
        });
    isLoading = false;
  }
}
