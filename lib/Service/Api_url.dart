import 'package:http/http.dart' as http;
class ApiUrl {

  static final  userClient = http.Client();

   static const baseUrl = 'demo.webpointbd.com'; 
  static const logInUrl = 'teacher-login'; 
}