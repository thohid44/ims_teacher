import 'dart:convert';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';

import 'package:imsteacher/pages/login/view/otp_screen.dart';

import 'package:http/http.dart' as http;
class LoginController extends GetxController  {

  String card_no =''; 
  String password = ''; 
  final _box = GetStorage();
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
    "password": password
}); 

  if(res.statusCode==200){

  Get.to(OTPScreen());
    }else{
      Get.snackbar("Error", "Login Faild");
    }



  }

}