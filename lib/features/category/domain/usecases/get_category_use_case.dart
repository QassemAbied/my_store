import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/core/network/use_case.dart';
import '../category_repositories.dart';
import '../entities/category_entities.dart';

class GetCategoryUseCase extends UseCase<List<CategoryEntities>, NoParams> {
  final CategoryRepositories _categoryRepositories;

  GetCategoryUseCase(this._categoryRepositories);

  @override
  Future<ApiResult<List<CategoryEntities>>> call(NoParams params) async {
    return await _categoryRepositories.getCategories();
  }
}
