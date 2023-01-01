import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:imsteacher/pages/Home/deshboard.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Icon(Icons.abc, color: Colors.white,),
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
                        showDialog(context: context, builder:((context) {
                          return AlertDialog(
                            content: Container(
                              height: 100.h,
                              child: Text("Are You Sure?"),
                            ),
                            actions: [
                              Text("Yes")
                            ],
                          );
                        }));
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
}