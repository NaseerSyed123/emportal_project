class LoginModel {
  LoginModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
  });
  late final String message;
  late final String accessToken;
  late final String tokenType;

  LoginModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    return _data;
  }
}