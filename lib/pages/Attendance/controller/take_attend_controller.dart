import 'dart:convert';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/pages/Academic/model/academicClassesModel.dart';
import 'package:http/http.dart' as http;
import 'package:imsteacher/pages/Attendance/model/mobile_attdn_fetch_class.dart';

class TakeAttendController extends GetxController {

  var isLooding = false.obs; 
  List classList = [].obs;
  List<Attendance> mobile = <Attendance>[].obs;
  List<Map> mobile2 = <Map>[].obs;
  var clsId = [].obs;
  var classId;

  getClassId(id) {
    print("class id $id");
    classId = id;
    update();
  }

  mobile2Update() {
    mobile2;
    update();
  }

  var url = ApiUrl.baseUrl;
  getAcademicCls() async {
    var response =await ApiUrl.userClient.get(Uri.parse("$url/classes"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + ApiUrl.token,
    });
    var jsonData = json.decode(response.body);
    print(jsonData); 
    if (response.statusCode == 200) {
      AcademicClassesModel academic = AcademicClassesModel.fromJson(jsonData);
      classList = academic.classes!;

      update();
    }
  }

  void fetchMobileCls() async {
    print(clsId);
   try{
    isLooding(true); 
     var response = await http.post(
        Uri.parse(
            "$url/mobile-attendance?class_id=${clsId[0]}"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + ApiUrl.token,
        });
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      clsId.clear();
      MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData);
      mobile = data.attendances!;
// print("controller $mobile");\
 update();
    }
   }finally{
    isLooding(false); 
   }
   
  }

//   fetchMobileCls(id) async {
//     var response = await http.post(
//         Uri.parse(
//             "https://demo.webpointbd.com/api/mobile-attendance?class_id=$id"),
//         headers: {
//           'Accept': 'application/json',
//           'Authorization': 'Bearer ' + ApiUrl.token,
//         });
//     var jsonData = json.decode(response.body);

//     if (response.statusCode == 200) {
//       MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData);

//       mobile = data.attendances!;

// // print("controller $mobile");
//      update();

//     }
//   }
}
