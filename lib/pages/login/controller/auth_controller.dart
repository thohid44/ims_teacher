import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationManager extends GetxController with CacheManager{
final isLogged = false.obs; 
final auth_token =''.obs; 

void logOut(){
  isLogged.value = false; 
  removedToken(); 
}

void login(String? token) async{
  print("print from login $token");
  isLogged.value= true; 
  auth_token.value=token??''; 
  await saveToken(token);
}

}


mixin CacheManager {

Future<bool> saveToken(String? token) async{
  final box = GetStorage(); 
  await box.read(CacheManagerKey.TOKEN.toString() );
  return true; 
}
 
 String? getToken(){
  final box = GetStorage(); 
  return box.read(CacheManagerKey.TOKEN.toString());
 }

 Future<void> removedToken() async{
  final box = GetStorage(); 
  await box.remove(CacheManagerKey.TOKEN.toString());
 }

}

enum CacheManagerKey { TOKEN}