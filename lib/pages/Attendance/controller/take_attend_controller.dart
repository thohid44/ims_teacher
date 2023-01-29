import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';

class TakeAttendController extends GetxController{
  

  
   takeAttendance(String accademicId, int shiftId,String statusId,String date) async{
    // String date= '';
    // String stdAccademicId = '';
    // String shiftId='';
    // String attendStatusId = '';
    print(accademicId);
      var res = await ApiUrl.userClient.post(Uri.parse("https://demo.webpointbd.com/api/mobile-attendance-store"), 

      headers: {'Accept':'application/json', 'Authorization':'Bearer '+ApiUrl.token},
      body: {
    "date": date.toString(),
    "student_academic_id": accademicId.toString(), 
    "shift_id":shiftId, 
    "attendance_status_id":statusId.toString()
}); 

  if(res.statusCode==200){
  print("success");
    }else{
      Get.snackbar("Error", "Attendance Faild");
    }
  }
}