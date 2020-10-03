import 'package:chatweb/api/api_error.dart';
import 'package:firebase_core/firebase_core.dart';

class BaseApi extends FirebaseException {
  ApiError handleError(FirebaseException exception) {
    dynamic statusCode;
    String message;

    if (exception != null) {
      statusCode = exception.code;
      message = exception.message;
    } else {
      return null;
    }
    return ApiError(statusCode, message);
  }
}
