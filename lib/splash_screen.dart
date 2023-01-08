import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:imsteacher/pages/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  
 final _box = GetStorage();
  String?  checkLogIn;
 
  void initState(){
   checkLogIn = _box.read(LocalStoreKey.token); 
   print(checkLogIn);
  //  Timer(Duration(seconds: 2), () {
    checkLogIn==null?Get.offAll(LoginPage()):Get.offAll(DeashBoard()); 
   // });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             
          ],
        ),
      ),
    );
  }
}