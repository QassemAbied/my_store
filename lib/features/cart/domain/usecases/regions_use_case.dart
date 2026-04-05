import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/core/network/use_case.dart';

import '../repository.dart';

class RegionsUseCase extends UseCase<String,NoParams>{
  final CartRepository _cartRepository;
  RegionsUseCase(this._cartRepository);

  @override
  Future<ApiResult<String>> call(NoParams params)async {
   return await _cartRepository.getRegions();


  
  }

}