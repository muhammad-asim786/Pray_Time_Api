import 'package:http/http.dart';
import 'dart:convert';
class Network{
  Network(this.url);
  var url;
  Future<dynamic> getData() async{
    Response response = await get(url);

    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else{
      return response.statusCode;
    }
  }
  }