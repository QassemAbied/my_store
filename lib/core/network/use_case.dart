import 'api_result.dart';

abstract class UseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
