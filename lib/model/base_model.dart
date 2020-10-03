import 'package:chatweb/api/api_error.dart';

class BaseModel {
  ApiError apiError;
  BaseModel({this.apiError});

  BaseModel.withError(ApiError apiError) : apiError = apiError;
}
