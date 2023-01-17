import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';

class TakeAttendController extends GetxController{
  

  
  Future<void> takeAttendance() async{
    String date= '';
    String stdAccademicId = '';
    String shiftId='';
    String attendStatusId = '';
      var res = await ApiUrl.userClient.post(Uri.https("https://demo.webpointbd.com/api","/mobile-attendance-store"), body: {
    "date": date,
    "student_academic_id": stdAccademicId, 
    "shift_id":shiftId, 
    "attendance_status_id":attendStatusId
}); 

  if(res.statusCode==200){
  

    }else{
      Get.snackbar("Error", "Attendance Faild");
    }
  }
}