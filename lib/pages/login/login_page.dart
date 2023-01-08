import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';

import 'package:imsteacher/pages/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _card_no = TextEditingController(); 
  final TextEditingController _password = TextEditingController(); 
  final _logKey = GlobalKey<FormState>();

  LoginController _controller = Get.put(LoginController()); 
   final _box = GetStorage();
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: Form(
          key: _logKey,
          child: ListView(
            children: [
              SizedBox(height: 70.h,),
              Center(
                child: Container(
                
                  height: 140.h,
                  width: 140.w,
        
                  child: CircleAvatar(
                   backgroundColor: primaryColor,
                    child: Text("LOGO",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                  ),
                ),
              ), 
              SizedBox(height: 40.h,), 
              Center(
                child: Container(child: Text("Sign In", 
                style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
                ),),
              ), 
              SizedBox(height: 40.h,), 
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: _textinput(
                  controller:_card_no, 
                  hint:"Teacher Id", 
                  userErrorText:"Teacher Id is wrong"
                )
              ),
         SizedBox(height: 15.h,), 
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child:_textinput(
                  controller:_password, 
                  hint:"Passwrod", 
                  userErrorText:"Password is wrong"
                )
              ),
         SizedBox(height: 40.h,), 
              InkWell(
                onTap: (() {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>DeashBoard()));
              checklogin(); 
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
      ),
    );
  }


void checklogin() {
    final _isValid = _logKey.currentState!.validate();
    if (_isValid) {
     // signInController.singIn(mobile.text, password.text);
     _controller.checkLogin(_card_no.text.toString(), _password.text.toString());
    } else {
      Get.snackbar(
        "Sign IN Failed",
        "User Name or Password is wrong",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}



Widget _textinput({controller, hint, icon, inputAction, userErrorText}) {
  return Container(

    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: TextFormField(
      textInputAction: inputAction,
      validator: (value) {
        if (value!.isEmpty) {
          return userErrorText;
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        hintStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          gapPadding: 4.6,
        ),
      ),
    ),
  );
}


