import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:imsteacher/pages/login/view/otp_screen.dart';
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
  
 // var response = await http.post(Uri.parse('uri')); 
  var res = await ApiUrl.userClient.post(Uri.parse("https://demo.webpointbd.com/api/teacher-login"), body: {
    "card_no": card_no,
    "password": "123"
}); 

  if(res.statusCode==200){
  print(res.body); 
  Get.to(OTPScreen());
    }else{
      Get.snackbar("Error", "Login Faild");
    }



  }

}