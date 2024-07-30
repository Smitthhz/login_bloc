class LoginReqModel {
  String? username;
  String? password;

  LoginReqModel({this.username, this.password});

  LoginReqModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['username'] = username;
    // data['password'] = password;
    if (username != null) {
      data['username'] = username;
    }
    if (password != null) {
      data['password'] = password;
    }
    return data;
  }
}
