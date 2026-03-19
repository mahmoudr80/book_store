import 'api_error_model.dart';

sealed class ApiResult<T> {
const ApiResult();
  //sealed pattern which gives you always two states one success another is failure
  //any request that app does will use ApiResult to get on state and check this state
  factory ApiResult.success(T data)=Success;
  factory ApiResult.failure(ApiErrorModel error)=Failure;
}

class Success<T> extends ApiResult<T>{
  final T data;

  const Success(this.data);
}
class Failure<T> extends ApiResult<T>{
final ApiErrorModel errorModel;

const Failure(this.errorModel);
}