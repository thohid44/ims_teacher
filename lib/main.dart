import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:imsteacher/pages/login/controller/auth_controller.dart';
import 'package:imsteacher/pages/login/login_page.dart';
import 'package:imsteacher/splash_screen.dart';

Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized(); 
await GetStorage.init(); 
Get.put(AuthenticationManager());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
         
          debugShowCheckedModeBanner: false,
          title: 'Teacher WPIMS',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: isToken() ? DeashBoard(): LoginPage(),
        );
      },
      
    );
  }
 final _box = GetStorage();
  bool isToken(){

    var result1 =_box.read(LocalStoreKey.token.toString());
  print("key cehck $result1"); 
       if(result1 !=null){
        return true;
       }else{
        return false;
       }
     
  //  final AuthenticationManager authManager = Get.find<AuthenticationManager>();
  //   var result = authManager.getToken().toString();
  //   print(result);
  //   if(result != null){
  //     authManager.login(result);
  //     return true; 
  //   }else{
  //     return false; 
  //   }
      }
}

