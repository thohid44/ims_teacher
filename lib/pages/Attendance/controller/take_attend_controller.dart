import 'dart:convert';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/pages/Academic/model/academicClassesModel.dart';
import 'package:http/http.dart' as http;
import 'package:imsteacher/pages/Attendance/model/mobile_attdn_fetch_class.dart';
import '../model/attendance_model.dart';
import 'package:imsteacher/pages/Attendance/model/attendance_model.dart';

class TakeAttendController extends GetxController {
  
  List  classList = [].obs; 
  
  
  
    List<Attendance> mobile = <Attendance>[].obs;
    
  List<Map> mobile2 = <Map>[].obs;
  String classId = ''; 
  
   getClassId(id){
classId=id; 
update();
   }
  mobile2Update(){
    mobile2; 
    update(); 
  }
   getAcademicCls() async {
    String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient
        .get(Uri.parse("https://demo.webpointbd.com/api/classes"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + ApiUrl.token,
    });
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      AcademicClassesModel academic = AcademicClassesModel.fromJson(jsonData); 

    
       classList=academic.classes!; 
    
        update();
     
    }
    
  }

  fetchMobileCls() async {
    var response = await http.post(
        Uri.parse(
            "https://demo.webpointbd.com/api/mobile-attendance?class_id=$classId"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + ApiUrl.token,
        });
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData);

      mobile = data.attendances!;
      
// print("controller $mobile");
     update();
    } 
  }
}
