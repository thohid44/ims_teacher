import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController  {

  String card_no =''; 
  String password = ''; 

  Future<void> checkLogin(String card_no, String password) async{


  Map<String,dynamic>  data = {
   card_no:card_no,
   password:password
  };

  print(card_no); 
  print(password);
   Get.to(DeashBoard());
 //  var response = await http.post(Uri.parse('uri')); 
   //var res = await ApiUrl.client.post(Uri.https(ApiUrl.baseUrl,ApiUrl.logInUrl), body: json.encode(data)); 

  //  if(res.statusCode==200){
  //   print(res); 
  //  }

  }

}