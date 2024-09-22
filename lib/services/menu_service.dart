import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mad/model/menu.dart';

class MenuService {

  Future<List<Menu>> getMenu() async {
    final url = "http://ec2-47-129-48-80.ap-southeast-1.compute.amazonaws.com/menu.json";
    try{
      final resp = await http.get(Uri.parse(url));
      if(resp.statusCode == 200){
        // final respBody = jsonDecode(resp.body) as List;
        final respBody = jsonDecode(utf8.decode(resp.bodyBytes)) as List;
        List<Menu> menuList = respBody.map((e) => Menu.fromJson(e)).toList();
        return menuList;
      }else{
        print("Error : ${resp.statusCode}");
        throw("Error ${resp.statusCode}");
      }
    }catch(err){
      print("Error $err");
      throw("Error : $err");
    }
  }
}