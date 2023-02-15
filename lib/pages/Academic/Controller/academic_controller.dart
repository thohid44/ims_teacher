
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Academic/model/examinationsModel.dart';
import 'package:imsteacher/pages/Exam%20Routine/model/exam_routine_model.dart';

class AcademicController extends GetxController {

final _box = GetStorage(); 
 var isExamLoading = false.obs; 
var url = ApiUrl.baseUrl; 
  List examList = [].obs;
  
 getSelectExam() async {
 
   var token =  _box.read(LocalStoreKey.token);
  print(token);  
    var response = await ApiUrl.userClient.get(
        Uri.parse("$url/examinations"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+token,
        });
    var jsonData = json.decode(response.body);

  print(jsonData);
    if (response.statusCode == 200) {
      
   ExaminationsModel academic = ExaminationsModel.fromJson(jsonData);
      examList = academic.exams!;

      update();
    } 
      
  }
}