import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 90.h,),
            Center(
              child: Container(
              
                height: 150.h,
                width: 150.w,

                child: CircleAvatar(
                 backgroundColor: primaryColor,
                  child: Text("LOGO",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                ),
              ),
            ), 
            SizedBox(height: 45.h,), 
            Center(
              child: Container(child: Text("Sign In", 
              style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
              ),),
            ), 
            SizedBox(height: 45.h,), 
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: TextField(
                
                decoration: InputDecoration(
                  labelText: "Teachder Id",
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r)
                 )
                ),
              ),
            ),
 SizedBox(height: 15.h,), 
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: TextField(
                decoration: InputDecoration(
                   labelText: "Teachder Password",
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r)
                 )
                ),
              ),
            ),
 SizedBox(height: 40.h,), 
            InkWell(
              onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }),
              child: Container(
              
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                height: 50.h,
               
                decoration: BoxDecoration(
                  color: primaryColor, 
            
                  borderRadius: BorderRadius.circular(30.r)
                ),
                child:  Text("LOGIN", 
              style: TextStyle(fontSize: 22.sp, color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
              ),
              ),
            ), 

            SizedBox(height: 15.h,)
          ],
        ),
      ),
    );
  }
}