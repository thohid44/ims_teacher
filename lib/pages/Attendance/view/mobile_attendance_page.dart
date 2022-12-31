import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/model/mobile_attdn_fetch_class.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class MobileAttendancePage extends StatefulWidget {
  const MobileAttendancePage({super.key});

  @override
  State<MobileAttendancePage> createState() => _MobileAttendancePageState();
}

class _MobileAttendancePageState extends State<MobileAttendancePage> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;

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
  bool selectClass = false;
  Future<MobileAttendFetchClass> fetchMobileCls() async {
    var response = await ApiUrl.userClient.post(
        Uri.parse(
            "https://demo.webpointbd.com/api/mobile-attendance?class_id=$selectedValue"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + ApiUrl.token,
        });
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      return MobileAttendFetchClass.fromJson(jsonData);
    } else {
      return MobileAttendFetchClass.fromJson(jsonData);
    }
  }

  @override
  void initState() {
    fetchMobileCls();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              selectClass == true
                  ? FutureBuilder(
                      future: fetchMobileCls(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DataTable(
                               headingRowColor:
        MaterialStateColor.resolveWith((states) =>offWhite),
 
                              columns: const [
                                DataColumn(
                                    label: Text(
                                  "ID",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                DataColumn(
                                    label: Text(
                                  "Name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                DataColumn(
                                    label: Text(
                                  "Status",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                              ],
                              rows: snapshot.data!.attendances!
                                  .map((e) => DataRow(cells: [
                                        DataCell(
                                          customText(e.studentId.toString(),
                                              dark, 13.0, FontWeight.bold),
                                        ),
                                        DataCell(
                                          customText(e.studentName.toString(),
                                              dark, 13.0, FontWeight.bold),
                                        ),
                                        DataCell(
                                          Switch(
                                              value: false,
                                              onChanged: (value) {
                                                print(value);
                                                setState(() {
                                               status1 =!status1;
                                                });
                                              }),
                                        )
                                      ]))
                                  .toList());
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  : Container(
                      child: Center(
                        child: Text("Please Select a Class"),
                      ),
                    ),
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
}
