import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';

import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:imsteacher/pages/login/login_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _box = GetStorage(); 
  Future<void> logout() async{
    _box.remove(LocalStoreKey.token); 
  }
  void initState(){

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     var logo= _box.read(LocalStoreKey.logo);
    return Container(
      margin: EdgeInsets.only(right: 40.h),
       child: ClipPath(
      clipper:LDOvalRightBorderClipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
         child: Drawer(
          
          backgroundColor: Color(0xff1A1A1A),
           child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                padding: EdgeInsets.zero,
                child: ListView(
             children: [
              DrawerHeader(child:Container(
                margin: EdgeInsets.only(right: 25),
                child: Center(
                  child: Image.network("$logo")
                ),
              )),
              ListTile(
                   onTap: () {
                Get.to(DeashBoard());
                   },
                      title: const Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    ),
                     ListTile(
                   
                      title: const Text(
                      'Profile',
                      style:
                       TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    onTap: (){

                    },
                    ),
                       ListTile(
                   
                      title: const Text(
                      'Change Password',
                      style:
                       TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    onTap: (){

                    },
                    ),
                            ListTile(
                   
                      title: const Text(
                      'LogOut',
                      style:
                       TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    onTap: (){
                      _showAlertDialog();
                    },
                    ),
             ],
                ),
              )
            ],
           ),
         ),
       ),
     );
  }
  Future<void> _showAlertDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog( // <-- SEE HERE
      
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w, top: 15.h),
                child: Text('Do you  want to Logout?',style: TextStyle(
                  fontSize: 15.sp,fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              logout();
              Get.off(LoginPage());
            },
          ),
        ],
      );
    },
  );
}
}