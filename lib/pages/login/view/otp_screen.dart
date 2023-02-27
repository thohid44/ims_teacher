import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:imsteacher/pages/login/controller/auth_controller.dart';
import 'package:imsteacher/pages/login/model/otp_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class OTPScreen extends StatefulWidget {
  
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
 final TextEditingController _digit1 = TextEditingController(); 

  final TextEditingController _digit2 = TextEditingController(); 

 final TextEditingController _digit3 = TextEditingController(); 

 final TextEditingController _digit4 = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:customText("WPIMS TEACHER", Colors.white, 
          20.0, FontWeight.w600) ,
          centerTitle: true,
          backgroundColor: primaryColor,
      ),
      body: Column(
      
        children: [
         SizedBox(height: 60.h,), 
          Container(child:customText("Verification Code", Colors.green, 
          20.0, FontWeight.w600)),
 SizedBox(height: 30.h,), 
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child:customText("Please enter OTP sent on your registered phone number",dark, 
          17.0, FontWeight.w600)),
        SizedBox(height: 60.h,),
          Form(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 68, 
                  width: 64, 
                  child: TextFormField(
                    controller: _digit1,
                    onChanged: ((value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(), 
                      focusedBorder: OutlineInputBorder(), 
                      errorBorder: OutlineInputBorder()
                    ),
                    textAlign: TextAlign.center, 
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1), 
                     FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ), 
                 SizedBox(
                  height: 68, 
                  width: 64, 
                  child: TextFormField(
                    controller: _digit2,
                    onChanged: ((value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(), 
                      focusedBorder: OutlineInputBorder(), 
                      errorBorder: OutlineInputBorder()
                    ),
                    textAlign: TextAlign.center, 
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1), 
                     FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ), 
                 SizedBox(
                  height: 68, 
                  width: 64, 
                  child: TextFormField(
                     controller: _digit3,
                    onChanged: ((value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      enabledBorder: OutlineInputBorder(), 
                      focusedBorder: OutlineInputBorder(), 
                      errorBorder: OutlineInputBorder()
                    ),
                    textAlign: TextAlign.center, 
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1), 
                     FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ), 
                 SizedBox(
                  height: 68, 
                  width: 64, 
                  child: TextFormField(
                     controller: _digit4,
                    onChanged: ((value) {
                      if(value.length==1){
                    sendOtp();
                      }
                    }),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(), 
                      focusedBorder: OutlineInputBorder(), 
                      errorBorder: OutlineInputBorder()
                    ),
                    textAlign: TextAlign.center, 
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1), 
                     FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ), 

              ],
            ),
          )
          )
        ],
      ),
    );
  }

  final _box = GetStorage(); 
  var url = ApiUrl.baseUrl; 
 final AuthenticationManager authManager = Get.find<AuthenticationManager>();
  sendOtp() async{
   var data = _digit1.text.toString() + _digit2.text.toString()+_digit3.text.toString()+_digit4.text.toString();

  var res = await ApiUrl.userClient.post(Uri.parse("$url/teacher-otp-match"), body: {
    "otp": data
}); 
   var covertData = json.decode(res.body);
  if(res.statusCode==200){
    
    var resData = OtpModel.fromJson(covertData);

     _box.write(LocalStoreKey.token, resData.authToken);
     _box.write(ApiUrl.token, resData.authToken); 
     _box.write(LocalStoreKey.teacherId, resData.teacher!.cardId.toString());
     authManager.login(resData.authToken.toString());

     print("otp page ${authManager.getToken()}"); 

     Get.offAll(DeashBoard()); 
 
    }else{
      Get.snackbar("OTP", "Your OTP does not match"); 
    }



  }

  
}