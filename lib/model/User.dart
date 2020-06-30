class User {
  String token;

  User({this.token});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }

  String toString() {
    return "User(token: $token)";
  }
}