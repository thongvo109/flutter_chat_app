class LoginModel {
  String kind;
  LoginUserModel loginUserModel;
  LoginModel({this.kind, this.loginUserModel});
  LoginModel.fromJson(Map<String, dynamic> json)
      : kind = json['kind'],
        loginUserModel = LoginUserModel.fromJson(json['users']);
}

class LoginUserModel {
  String localId;
  String email;
  String passwordHash;
  bool emailVerified;
  int passwordUpdatedAt;
  List<ProviderUserInfo> providerUserInfo;
  String validSince;
  bool disabled;
  String lastLoginAt;
  String createdAt;
  int lastRefreshAt;
  LoginUserModel({
    this.localId,
    this.email,
    this.passwordHash,
    this.emailVerified,
    this.passwordUpdatedAt,
    this.providerUserInfo,
    this.validSince,
    this.disabled,
    this.lastLoginAt,
    this.createdAt,
    this.lastRefreshAt,
  });
  LoginUserModel.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        passwordHash = json["passwordHash"],
        emailVerified = json["emailVerified"],
        passwordUpdatedAt = json["passwordUpdatedAt"],
        providerUserInfo = (json['providerUserInfo'] as List)
            .map((e) => ProviderUserInfo.fromJson(e))
            .toList(),
        validSince = json["validSince"],
        disabled = json["disabled"],
        lastLoginAt = json["lastLoginAt"],
        createdAt = json["createdAt"],
        lastRefreshAt = json["lastRefreshAt"];
}

class ProviderUserInfo {
  final String email;
  final String federatedId;
  final String providerId;
  final String rawId;
  ProviderUserInfo({this.email, this.federatedId, this.providerId, this.rawId});

  ProviderUserInfo.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        federatedId = json['federatedId'],
        providerId = json['providerId'],
        rawId = json['rawId'];
}
