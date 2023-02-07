import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Academic/model/academicClassesModel.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';

import 'package:imsteacher/pages/Attendance/model/mobile_attdn_fetch_class.dart';
import 'package:imsteacher/pages/Attendance/model/store_attendance_model.dart';
import 'package:imsteacher/pages/Attendance/model/student.dart';
import 'package:imsteacher/pages/Attendance/view/std.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:http/http.dart' as http;

class MobileAttendancePage extends StatefulWidget {
  const MobileAttendancePage({super.key});

  @override
  State<MobileAttendancePage> createState() => _MobileAttendancePageState();
}

class _MobileAttendancePageState extends State<MobileAttendancePage> {
  bool status = false;

  Future<AcademicClassesModel> getAcademicCls() async {
    String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient
        .get(Uri.parse("https://demo.webpointbd.com/api/classes"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + ApiUrl.token,
    });
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      return AcademicClassesModel.fromJson(jsonData);
    }
    return AcademicClassesModel.fromJson(jsonData);
  }

// get class
  String? classValue;

  String selectedValue = "Select Class";
  List<AttendanceStoreModel> storeAttendance = [];

  List<Attendance> mobile = [];
var mobile2 = []; 
  bool selectClass = false;
  fetchMobileCls() async {
    var response = await http.post(
        Uri.parse(
            "https://demo.webpointbd.com/api/mobile-attendance?class_id=5"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + ApiUrl.token,
        });
    var jsonData = json.decode(response.body);
    
    if (response.statusCode == 200) {
      
      MobileAttendFetchClass data = MobileAttendFetchClass.fromJson(jsonData);
     
      mobile = data.attendances!;
 
      return mobile;
    } else {
      return mobile;
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
          elevation: 0,
          title: const Text("MOBILE ATTENDENCE"),
          backgroundColor: primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                  height: 40.h,
                  alignment: Alignment.center,
                  width: 150.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey)),
                  child: FutureBuilder<AcademicClassesModel>(
                    future: getAcademicCls(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!;
                      
                 
                        return DropdownButton(
                            hint: Text("Select Class "),
                            underline: SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: classValue,
                            items: data.classes!
                                .map((e) => DropdownMenuItem(
                                      value: e.numericClass,
                                      child: Text(
                                        "${e.name}",
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                classValue = value.toString();
                               fetchMobileCls();
                               mobile2 = mobile.map((e) {
                                 return { 
                                      "student_academic_id": e.studentAcademicId, "shift_id":e.shiftId, "attendance_status_id": 2,
                                 };
                               }).toList();
                              
                          
                                print(classValue);
                              });
                          
                            });
                      }
                      return Center(
                        child: Text("Looding..."),
                      );
                    }),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  child: ListTile(
                leading: Text("ID"),
                title: Text("Name"),
                trailing: Text("Status"),
              )),
              Container(
                  height: 400.h,
                  child: ListView.builder(
                      itemCount: mobile.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Text(mobile[index].studentId.toString()),
                          title: Text(mobile[index].studentName.toString()),
                          trailing: InkWell(
                              onTap: (() {
                            
                           for(int i = 0 ; i<= mobile.length; i++){
                             if(mobile2[index]['student_academic_id']==mobile2[index]['student_academic_id']){
                            setState(() {
                               mobile2[index]['attendance_status_id']=1; 
                            });
                         
                             }
                               
                             //print(mobile); 
                           print(mobile2); 
                           }
                              }),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40.w,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                  child: mobile2.contains(mobile2[index]['']=='1')? Text(
                                    "Present",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ):Text(
                                    "Present",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  
                                  ) ,
                                  ),
                        );
                      }))),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                alignment: Alignment.center,
                height: 50.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: InkWell(
                  onTap: () {
                    sendAttendance();
                  },
                  child: customText(
                      "Save Attendance", Colors.white, 18.0, FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }

  List attendList = [];

  



  takeAttendance(String studentAcademicId, 
      String attendanceStatusId, ) async {

  

    for(int i=0; i<mobile2.length; i++){
    if(mobile2[i]['student_academic_id']==47){

     setState(() {
        mobile2[i]['attendance_status_id'] = "1"; 

     });
   
    }
       
  }


    

    // print(attendList);
   //   print(std1);
  }

  

  List<Map<String, dynamic>> std1 = [];

  // List<Map<String, dynamic>> std1 = [
  //   {"student_academic_id": 100, "shift_id": 2, "attendance_status_id": 1},
  //   {"student_academic_id": 100, "shift_id": 1, "attendance_status_id": 1}
  // ];
  List<Students> students = [
    Students(studentAcademicId: "1", shiftId: "1", attendanceStatusId: "1"),
    Students(studentAcademicId: "2", shiftId: "2", attendanceStatusId: "2")
  ];

  sendAttendance() async {
    var postUri =
        Uri.parse("https://demo.webpointbd.com/api/mobile-attendance-store");
    Map<String, dynamic> map = {
      "status": true,
      "date": "2023-02-05",
      "academic_class_id": 5,
      "attendances": mobile2
    };
    var finalmap = jsonEncode(map);

    try {
      print("try");
      var request = await http.post(postUri, body: finalmap, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + ApiUrl.token,
      });
      print("$request");

      final resdata = request;
      ;
      if (resdata.statusCode == 200) {
        print("ff ${resdata.body}");
      } else {}
      print(resdata.body);
    } catch (e) {
      print(e);
    }
  }
}
