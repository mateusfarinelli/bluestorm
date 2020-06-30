import 'package:http/http.dart' as http;
import 'package:bluestorm/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class UserLogin {
  static Future<User> login(String username, String password) async {

    var url = 'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/login';
    var header = {"Content-Type":"application/json"};

    Map params = {
      "username": username,
      "password": password,
      "domain": "djbnrrib9e.execute-api.us-east-2.amazonaws.com"
    };

    var reqBody = json.encode(params);
    var response = await http.post(url, headers:header, body:reqBody);
    var user;
    var preferences = await SharedPreferences.getInstance();

    Map mapResponse = json.decode(response.body);


    if(response.statusCode == 200) {
      user = User.fromJson(mapResponse);
      preferences.setString("token", mapResponse["data"]["token"]);
    }
    else {
      user = null;
    }  
  return user;
  }
}