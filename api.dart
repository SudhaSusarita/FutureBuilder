import 'dart:convert';

import 'package:http/http.dart' as http;
class Api{

   Future<dynamic> getDetails() async{
    final response = await http.get("http:/");
    return json.decode(response.body);
  }
}
