import '../../domain/entities/product_details_request.dart';
import '../models/product_details_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> getProductDetails(ProductDetailsRequest params) ;

}