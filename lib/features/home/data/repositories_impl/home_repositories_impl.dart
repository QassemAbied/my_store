import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/features/home/domain/entities/product_entities.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';

import '../../domain/mappers/product_mapper.dart';

class HomeRepositoriesImpl implements HomeRepositories{
  final RemoteDataSource remoteDataSource;

  HomeRepositoriesImpl(this.remoteDataSource);
  @override
  Future<ProductEntities> getProducts() async{
    final response=await remoteDataSource.getProducts();
    return ProductMapper.toEntity(response);

  }
}