import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Academic/model/academicClassesModel.dart';
import 'package:http/http.dart' as http;
import 'package:imsteacher/pages/Attendance/model/mobile_attdn_fetch_class.dart';

import '../../Subject/model/subject_model.dart';

class TakeAttendController extends GetxController {

  var isLooding = false.obs; 
  List classList = [].obs;
  List<Attendance> mobile = <Attendance>[].obs;
  List<Map> mobile2 = <Map>[].obs;
  var clsId = [].obs;
  var classId;

  getClassId(id) {
    print("class id2 $id");
   classId = id;
  print("Thohid con $classId");
  }

  mobile2Update() {
  
    mobile2;
    update();
  }
   final _box = GetStorage(); 
   
  var url = ApiUrl.baseUrl;
  getAcademicCls() async {
 var token =  _box.read(LocalStoreKey.token);
    var response = await ApiUrl.userClient.get(Uri.parse("$url/classes"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token,
    });
    var jsonData = json.decode(response.body);
   
    if (response.statusCode == 200) {
      AcademicClassesModel academic = AcademicClassesModel.fromJson(jsonData);
      classList = academic.classes!;

      update();
    }
  }

  void fetchMobileCls(var id) async {
 

   try{
   
     var token =  _box.read(LocalStoreKey.token);
     var response = await http.get(
        Uri.parse(
            "$url/mobile-attendance?class_id=$id"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' +token,
        });
    var jsonData = json.decode(response.body);
   
    if (response.statusCode == 200) {
     
      clsId.clear();
     MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData);
      mobile = data.attendances!;
     mobile2 = mobile.map((e) {


                                  return {
                                    "student_academic_id": e.studentAcademicId,
                                    "shift_id": e.shiftId,
                                    "attendance_status_id": true,
                                  };
                                }).toList();
     isLooding(true); 

 update();
    }
   }finally{
    isLooding(false); 
    
   }
   
  }
  List<Section> subjectList = <Section>[].obs;
    fetchSubject() async {
    var token = _box.read(LocalStoreKey.token);
    var response =
        await ApiUrl.userClient.get(Uri.parse("$url/sections"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token,
    });
    var jsonData = json.decode(response.body);
  print(jsonData); 
    if (response.statusCode == 200) {
      SubjectModel subject = SubjectModel.fromJson(jsonData);
      subjectList = subject.sections!;

      update();
    }
  }


//   fetchMobileCls() async {
//     var token =  _box.read(LocalStoreKey.token);
//         var response = await ApiUrl.userClient.get(Uri.parse("https://www.urkircharhs.edu.bd/api/mobile-attendance?class_id=${clsId[0]}"), headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer '+token,
//     });
//   print(response.body); 
//     var jsonData = json.decode(response.body);

//     if (response.statusCode == 200) {
   
//       MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData);

//       mobile = data.attendances!;

//  print(data); 
//      update();

//     }
//     print("controller $mobile");
//   }
 }
