import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';

import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../Home/custom_navigation_bar.dart';

class MobileAttendancePage extends StatefulWidget {
  const MobileAttendancePage({super.key});

  @override
  State<MobileAttendancePage> createState() => _MobileAttendancePageState();
}

class _MobileAttendancePageState extends State<MobileAttendancePage> {
  bool status = false;
  bool isSelected = true;
  var url = ApiUrl.baseUrl;
// get class
  String? classValue;
  var classId;

  String? selectedValue;
  bool isSelect = false;
  bool selectClass = false;

  @override
  void initState() {
    date=''; 
    super.initState();
  }

  var _con = Get.put(TakeAttendController());
  var s1 = 2;
  bool f1 = false;
  final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    _con.getAcademicCls();
    _con.clsId;
    _con.classList;

    print(_con.mobile.length);

    print("class data ${_con.classList}");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("MOBILE ATTENDENCE"),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left:8.0.w,right: 8.0.w, top: 8.0.h),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
                height: 35.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                width: 200.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey)),
                child: GetBuilder<TakeAttendController>(builder: (context) {
                  return DropdownButton(
                      hint:
                          Text("${isSelect ? selectedValue : 'Select Class'}"),
                      underline: SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: classValue,
                      items: _con.classList
                          .map((e) => DropdownMenuItem(
                                onTap: () {
                                  selectedValue = e.name.toString();
                                },
                                value: e.id,
                                child: Text(
                                  "${e.name}",
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        var id = value;
                        _con.fetchMobileCls(id);
                        // _con.getClassId(value.toString());
                        setState(() {
                          classId = value.toString();
                          isSelect = true;
                          print(classId);
                          selectClass = true;
                        });
                      });
                })),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Container(
                      margin: EdgeInsets.only(left: 80.w),
                      width: 170.w, height: 35.h, child: _buildDatePicker()),
                
              ],
            ),
            // Container(
            //     child: ListTile(
            //   leading: Text("Roll"),
            //   title: Text("Name"),
            //   trailing: Text("Status"),
            // )),
            Container(
              margin: EdgeInsets.only(left: 10.w, right: 15.w, top: 10.h),
              child: Row(
              
                children: [
                  Text("Roll",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ),), 
                  SizedBox(width: 30.w,), 
                   Text("Name",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ),), 
                   SizedBox(width: 170.w,), 
                    Text("Status",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ),), 
                ],
              ),
            ), 
            selectClass == true
                ? Container(
                    height: 360.h,
                    
                    padding: EdgeInsets.only(left: 10.w, right: 5.w, ),
                    child: GetBuilder<TakeAttendController>(builder: (context) {
                      if (_con.mobile.length > 0) {
                        return ListView.builder(
                  
                          itemCount: _con.mobile.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 45,
                              margin:EdgeInsets.only(bottom:13.h), 
                              child: ListTile(
                         
                                contentPadding: EdgeInsets.all(0),
                                  leading: Text(_con
                                      .mobile[index].studentAcademicId
                                      .toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, )),
                                  title: Text(
                                      _con.mobile[index].studentName.toString(),
                                      style: TextStyle(color: Colors.black,fontSize: 13.sp, fontWeight: FontWeight.bold, )),
                                     subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _con.mobile[index].studentId.toString(),
                                        style: TextStyle(fontSize: 15.sp, )
                                      ),
                                      
                                      Icon(Icons.copy, size: 18.w, color: Colors.purple,)
                                    ],
                                  ),
                                  // subtitle: Text(
                                  //   _con.mobile2[index]['attendance_status_id'].toString(),
                                  //   style: TextStyle(fontSize: 15.sp, )
                                  // ),
                                        onTap: (){
                                  FlutterClipboard.copy( _con.mobile[index].studentId.toString());
                                     
                                               },
                                  trailing: Switch(
                                    value: _con.mobile2[index]
                                        ['attendance_status_id'],
                                    onChanged: (bool value) {
                                    print(value);
                                   for (int i = 0;
                                          i <= _con.mobile2.length;
                                          i++) {
                                        if (_con.mobile2[i]
                                                    ['student_academic_id'] ==
                                                _con.mobile2[index]
                                                    ['student_academic_id'] &&
                                            _con.mobile2[index]
                                                    ['attendance_status_id']) {
                                       
                                            setState(() {
                                              _con.mobile2[index]
                                                ['attendance_status_id'] = false;
                                            });
                                         
                              
                                        } else if(_con.mobile2[i]
                                                    ['student_academic_id'] ==
                                                _con.mobile2[index]
                                                    ['student_academic_id'] &&
                                            _con.mobile2[index]
                                                    ['attendance_status_id']==false){
                                                      setState(() {
                                              _con.mobile2[index]
                                                ['attendance_status_id'] = true;
                                            });

                                        }
                                        //print(mobile);
                                      }
                                    },
                                  ),
                                  ),
                            );
                          }),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }))
                : Center(
                    child: Text("Please Select Class"),
                  ),
           SizedBox(height: 10.h,), 
            selectClass == true
                ? Container(
                    margin: EdgeInsets.only(left: 60.w, right: 60.w),
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                    ),
                    child: InkWell(
                      onTap: () {
                        if(date.isEmpty){
 Get.snackbar(
          "Please",
          "Select Date",
          
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
        );
                        }else{
                          sendAttendance();
                        }
                    
                      },
                      child: customText("Save Attendance", Colors.white, 18.0,
                          FontWeight.bold),
                    ),
                  )
                : Container(),
                
          ],
        ),
      ),

     bottomNavigationBar: CustomNavigationBar(),
    );
  }

  final _box = GetStorage();
  sendAttendance() async {
    var token = _box.read(ApiUrl.token);
    var postUri = Uri.parse("$url/mobile-attendance-store");

    Map<String, dynamic> map = {
      "status": true,
      "date": date,
      "academic_class_id": classId,
      "attendances": _con.mobile2
    };
    var finalmap = jsonEncode(map);

    try {
      print("try");
      var request = await http.post(postUri, body: finalmap, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token,
      });
      print("$request");

      final resdata = request;
      ;
      if (resdata.statusCode == 200) {
        print("ff ${resdata.body}");
        Get.snackbar(
          "Attendance",
          "Successfully Save",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.purple,
        );
        Get.to(DeashBoard());
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
              date = dateController.text;
              print(date);
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
