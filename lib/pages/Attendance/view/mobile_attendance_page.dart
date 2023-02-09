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
import 'package:intl/intl.dart';

class MobileAttendancePage extends StatefulWidget {
  const MobileAttendancePage({super.key});

  @override
  State<MobileAttendancePage> createState() => _MobileAttendancePageState();
}

class _MobileAttendancePageState extends State<MobileAttendancePage> {
  bool status = false;

// get class
  String? classValue;

  String selectedValue = "Select Class";

  var mobile2 = [];
  bool selectClass = false;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var _con = Get.put(TakeAttendController());
    _con.getAcademicCls();

    print(_con.mobile);
    _con.classList;

    print("class data ${_con.classList}");
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
              Row(
                children: [
                  Container(
                      width: 160.w, height: 45.h, child: _buildDatePicker()),
                  Container(
                      height: 40.h,
                      alignment: Alignment.center,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: Colors.grey)),
                      child:
                          GetBuilder<TakeAttendController>(builder: (context) {
                        return DropdownButton(
                            hint: Text("Select Class "),
                            underline: SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: classValue,
                            items: _con.classList
                                .map((e) => DropdownMenuItem(
                                      value: e.numericClass,
                                      child: Text(
                                        "${e.name}",
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectClass = true;
                         
                              });
                              classValue = value.toString();
                                    _con.getClassId(value); 
                              _con.mobile;
                            
                              _con.fetchMobileCls(classValue.toString());

                              _con.mobile2 = _con.mobile.map((e) {
                                return {
                                  "student_academic_id": e.studentAcademicId,
                                  "shift_id": e.shiftId,
                                  "attendance_status_id": 2,
                                };
                              }).toList();
                            });
                      })),
                ],
              ),
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
                      child:
                          GetBuilder<TakeAttendController>(builder: (context) {
                       if(_con.mobile.isNotEmpty && selectClass==true){
 return ListView.builder(
                            itemCount: _con.mobile.length,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: Text(
                                    _con.mobile[index].studentId.toString()),
                                title: Text(
                                    _con.mobile[index].studentId.toString()),
                                trailing: InkWell(
                                  onTap: (() {
                                    _con.mobile2Update();
                                    for (int i = 0;
                                        i <= _con.mobile.length;
                                        i++) {
                                      if (_con.mobile2[index]
                                              ['student_academic_id'] ==
                                          _con.mobile2[index]
                                              ['student_academic_id'] && _con.mobile2[index]
                                            ['attendance_status_id'] == 2  ) {
                                        _con.mobile2[index]
                                            ['attendance_status_id'] = 1;
                                      }else{
                                        _con.mobile2[index]
                                            ['attendance_status_id'] = 2;
                                      }

                                      //print(mobile);
                                      print(_con.mobile2);
                                    }
                                  }),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.w,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        color: _con.mobile2[index]
                                                    ['attendance_status_id'] ==
                                                1
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: _con.mobile2[index]
                                                ['attendance_status_id'] ==
                                            1
                                        ? Text(
                                            "Present",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            "Absent",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                  ),
                                ),
                              );
                            }));
                       }
                       return Center(child:CircularProgressIndicator()); 
                      }),),
                  
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

  takeAttendance(
    String studentAcademicId,
    String attendanceStatusId,
  ) async {
    for (int i = 0; i < mobile2.length; i++) {
      if (mobile2[i]['student_academic_id'] == 47) {
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

  // For Select and upload

  final TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  late String date;
  late String weekDay;
  Widget _buildDatePicker() {
    return TextFormField(
        controller: dateController,
        readOnly: true,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          suffixIcon: Icon(
            Icons.date_range,
            color: dark,
          ),
          hintText: "YYYY-MM-DD",
          hintMaxLines: 1,
          hintStyle: TextStyle(fontSize: 15.0),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        onTap: () async {
          final pickedDate = await selectDate(
              context: context,
              initialDate: selectedDate,
              allowedDays: _allowedDays);
          if (pickedDate != null && pickedDate != selectedDate) {
            setState(() {
              selectedDate = pickedDate;
              dateController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              print("thohid ${dateController.text}");
            });
          }
        });
  }

  bool _allowedDays(DateTime day) {
    if ((day.isBefore(DateTime.now()))) {
      return true;
    }
    return false;
  }

  selectDate(
      {required BuildContext context,
      required DateTime initialDate,
      required allowedDays}) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      selectableDayPredicate: allowedDays,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(),
            ),
          ),
          child: child!,
        );
      },
    );
    return selected;
  }
}
