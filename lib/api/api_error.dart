class ApiError {
  final dynamic statusCode;
  final String message;

  ApiError(this.statusCode, this.message);
}

class ErrorMessage {
  final String domain;
  final String message;
  final String reason;

  ErrorMessage({this.domain, this.message, this.reason});

  ErrorMessage.fromJson(Map<String, dynamic> json)
      : domain = json['domain'],
        message = json['message'],
        reason = json['reason'];
}

// class ApiError {
//   final int statusCode;
//   final List<String> errors;

//   ApiError(this.statusCode, this.errors);
// }
// //
