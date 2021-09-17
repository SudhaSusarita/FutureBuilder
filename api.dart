import 'dart:convert';

import 'package:http/http.dart' as http;
class Api{

   Future<dynamic> getDetails() async{
    final response = await http.get("http://192.168.1.21:8080/displayList");
    return json.decode(response.body);
  }
}
