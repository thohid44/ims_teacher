import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';

import 'package:imsteacher/pages/Attendance/model/mobile_attdn_fetch_class.dart';
import 'package:imsteacher/pages/Attendance/model/store_attendance_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:http/http.dart' as http;
class MobileAttendancePage extends StatefulWidget {
  const MobileAttendancePage({super.key});

  @override
  State<MobileAttendancePage> createState() => _MobileAttendancePageState();
}

class _MobileAttendancePageState extends State<MobileAttendancePage> {
 bool status = false; 

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Select Class"), value: "Select Class"),
      const DropdownMenuItem(child: Text("Class One"), value: "1"),
      const DropdownMenuItem(child: Text("Class Two"), value: "2"),
      const DropdownMenuItem(child: Text("Class Three"), value: "3"),
      const DropdownMenuItem(child: Text("Class Four"), value: "4"),
    ];
    return menuItems;
  }

  String selectedValue = "Select Class";
    List<AttendanceStoreModel> storeAttendance = [];

 late List<Attendance> moible; 
  bool selectClass = false;
   fetchMobileCls() async {
    var response = await http.post(Uri.parse("https://demo.webpointbd.com/api/mobile-attendance?class_id=1"),
  
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ApiUrl.token,
        });
    var jsonData = json.decode(response.body);
    //  print(jsonData);
    if (response.statusCode == 200) {
      MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData); 
       
         moible = data.attendances! ;
    
      return moible;  
    
    } else {
      return moible;
    }
  }

  @override
  void initState() {

    // TODO: implement initState

    super.initState();
  }
   final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TakeAttendController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("MOBILE ATTENDENCE"),
          backgroundColor: primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  height: 45.h,
                  alignment: Alignment.center,
                  width: 150.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey)),
                  child: DropdownButton(
                      underline: SizedBox(),
                      value: selectedValue,
                      style: TextStyle(color: Colors.black, fontSize: 17.sp),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          if (selectedValue == "Select Class") {
                            selectClass = false;
                          } else {
                            selectClass = true;
                          }
                        });
                      },
                      items: dropdownItems)),
              SizedBox(
                height: 10.h,
              ),
                   Container(
               child:ListTile(leading: Text("ID"),
               title: Text("Name"), 
               trailing: Text("Status"),
               
               )
                   ), 
                  Container(
                    height: 400.h,
                    child: FutureBuilder(
                        future: fetchMobileCls(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                             itemCount: moible.length,
                              itemBuilder:((context, index) {
                              return ListTile(
                                leading:  Text(moible[index].studentId.toString()),
                                title: Text(moible[index].studentName.toString()),
                                trailing: InkWell(
                                  onTap: (() {
                                  // storeData[index]['']
                                   takeAttendance("54", index+1, '1', "2023-01-19");
                                }),
                                child: Text("Present", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                
                                ),
                                ),
                                
                              );
                            }));
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                  )
                 ,
              SizedBox(
                height: 20.h,
              ),
              selectClass == true
                  ? Container(
                      margin: EdgeInsets.only(left: 30.w, right: 30.w),
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: customText("Save Attendance", Colors.white, 18.0,
                          FontWeight.bold),
                    )
                  : Container()
            ],
          ),
        ));
  }
List<AttendanceStoreModel> storeData= [];

   takeAttendance(String studentAcademicId, int shiftId,String attendanceStatusId,String date) async{
    storeData.add(AttendanceStoreModel(date: date, studentAcademicId: studentAcademicId, shiftId: shiftId.toString(), attendanceStatusId: attendanceStatusId));      
     print(storeData.first.attendanceStatusId);
    
    var convert = attendanceStoreModelToJson(AttendanceStoreModel(date: date, studentAcademicId: studentAcademicId, shiftId: shiftId.toString(), attendanceStatusId: attendanceStatusId));
    var jsonConvert = jsonDecode(convert);

   var response = await ApiUrl.userClient.post(Uri.https("demo.webpointbd.com","/api/mobile-attendance-store"), 

      headers: {'Accept':'application/json', 'Authorization':'Bearer '+ApiUrl.token},
      body: jsonConvert); 
    
  if(response.statusCode==200){
 print(response.body);
  print("success");
    }else{
       
      Get.snackbar("Error", "Attendance Faild");
    }

   
   }



}
