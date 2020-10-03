import 'package:chatweb/api/api_error.dart';
import 'package:chatweb/model/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends BaseModel {
  String userId;
  String email;
  String displayName;
  String photoUrl;
  UserModel({
    this.userId,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  UserModel.withError(ApiError apiError)
      : userId = '',
        email = '',
        displayName = '',
        photoUrl = '',
        super.withError(apiError);
}
