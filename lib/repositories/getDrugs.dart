import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bluestorm/model/Drug.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetDrugs {
  
  static Future<List<Drug>> getDrug() async {

    var url = 'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/drugs?name=Abilify';
    var preferences = await SharedPreferences.getInstance();
    String token = (preferences.getString("token" ?? ""));

    var header = {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token"
      };

    var response = await http.get(url, headers:header);
    Map mapResponse = json.decode(response.body);


    if(response.statusCode == 200) {
      final drugs = List<Drug>();
      for (Map map in mapResponse["data"]){
        Drug drug = Drug.fromJson(map);
        drugs.add(drug);
      }
      return drugs;
    }
    else {
      throw Exception;
    }
  }

}