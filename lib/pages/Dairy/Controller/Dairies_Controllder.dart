import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Dairy/model/all_dairy_model.dart';



class AllDairyController extends GetxController{

  final _box = GetStorage(); 
    var url = ApiUrl.baseUrl;
   var isImgFile = false.obs; 
   var imgFilePath = "".obs; 
  var imgFileBase64;

 void imageFileUpload(String path) async{
   imgFilePath.value = path; 
   isImgFile.value = true; 
   final bytes = File(imgFilePath.value).readAsBytesSync(); 
    imgFileBase64 = base64.encode(bytes); 
 
  }

  uploadDiary(String accademicId,var date, String subId) async {
      var token = _box.read(LocalStoreKey.token);
    var teacher_id = _box.read(LocalStoreKey.teacherId);
    try{
         print("Date is $date"); 
      if(accademicId.isEmpty){
      Fluttertoast.showToast(msg: "Accademic ID Field is Required" ,backgroundColor: Colors.redAccent,
      textColor: Colors.white, 
      fontSize: 16.sp,
      gravity: ToastGravity.BOTTOM
       ); 
     } else if(date.isEmpty){
   
       Fluttertoast.showToast(msg: "Date Field is Required" ,backgroundColor: Colors.redAccent,
      textColor: Colors.white, 
      fontSize: 16.sp,
      gravity: ToastGravity.BOTTOM
       ); 
     }else if(subId.isEmpty){
       Fluttertoast.showToast(msg: "Subject ID Field is Required" ,backgroundColor: Colors.redAccent,
      textColor: Colors.white, 
      fontSize: 16.sp,
      gravity: ToastGravity.BOTTOM
       ); 
     }
    var  dairy = {
       "academic_class_id":accademicId, 
       "date":"2023-02-28", 
       "teacher_id":teacher_id,
       "subject_id":subId, 
       "description":imgFileBase64
    };
    var sendDiary = json.encode(dairy); 
      
     var response = await ApiUrl.userClient
        .post(Uri.parse('$url/teacher-add-diary'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+ token,
    }, body: {
       "academic_class_id":accademicId, 
       "date":date, 
       "teacher_id":teacher_id,
       "subject_id":subId, 
       "description":imgFileBase64
    });
   
    var data = json.decode(response.body);
   print(data); 
    if (response.statusCode == 200) {
      Get.snackbar("Data", "Successfully Added");
    }
    }catch(e){
    Fluttertoast.showToast(msg: e.toString());
    }
  
  }
  
  //  addNewDairy() async {
  //   var token = _box.read(LocalStoreKey.token);
  //   var teacher_id = _box.read(LocalStoreKey.teacherId);

    
   
    // var response = await ApiUrl.userClient
    //     .post(Uri.parse('$url/teacher-add-diary'), headers: {
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer ' + token,
    // }, body: {
    //   "academic_class_id": selectedValue.toString(),
    //   "date": dateController.text,
    //   "teacher_id": "1",
    //   "subject_id": subId.toString(),
    //   "description": ''
    // });
    // print(response);
    // var data = json.decode(response.body);
    // print(data);
    // if (response.statusCode == 200) {
    //   Get.snackbar("Data", "Successfully Added");
    // }
  }

