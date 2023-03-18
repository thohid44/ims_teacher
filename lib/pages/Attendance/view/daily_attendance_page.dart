import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';
import 'package:imsteacher/pages/Attendance/model/daily_attendance_model.dart';

import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:intl/intl.dart';
import 'package:native_screenshot/native_screenshot.dart';

import '../../Home/custom_navigation_bar.dart';

class DailyAttendancePage extends StatefulWidget {
  const DailyAttendancePage({super.key});

  @override
  State<DailyAttendancePage> createState() => _DailyAttendancePageState();
}

class _DailyAttendancePageState extends State<DailyAttendancePage> {
  var url = ApiUrl.baseUrl;

  var jsonData;

  bool selectCls = false;
  bool seletcdate = false;
  //akgm302
  String clsId = '';
  bool isSelect = false;
  String? selectedValue;
  final _box = GetStorage();
  String? classValue;
  bool selectClass = false;
  Future<DailyAttendanceModel> fetchDailyAttnd() async {
    var token = _box.read(LocalStoreKey.token);
    try {
      print("try");
      var response = await ApiUrl.userClient.get(
          Uri.parse(
              "$url/daily-attendance?date=${dateController.text}&class_id=$clsId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          });
      jsonData = json.decode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        return DailyAttendanceModel.fromJson(jsonData);
      }
    } catch (e) {
      print(e.toString());
    }
    return DailyAttendanceModel.fromJson(jsonData);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _con = Get.put(TakeAttendController());
    _con.getAcademicCls();
    return Scaffold(
        appBar: AppBar(
          title: const Text("DAILY ATTENDENCE"),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(width: 160.w, height: 45.h, child: _buildDatePicker()),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Academic Class
                Container(
                    height: 40.h,
                    alignment: Alignment.center,
                    width: 250.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: Colors.grey)),
                    child: GetBuilder<TakeAttendController>(builder: (context) {
                      return DropdownButton(
                          hint: Text(
                              "${isSelect ? selectedValue : 'Select Class'}"),
                          underline: SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: classValue,
                          items: _con.classList
                              .map((e) => DropdownMenuItem(
                                onTap: (() {
                                  setState(() {
                                    selectedValue = e.name.toString(); 
                                  });
                                }),
                                enabled: true,
                                    value: e.id,
                                    child: Text(
                                      "${e.name}",
                                    ),
                                  ))
                              .toList(),
                            
                          onChanged: (value) {
                            setState(() {
                              selectCls = true;

                              isSelect = true;
                              if (selectCls && dateController != null) {
                                clsId = value.toString();
                                fetchDailyAttnd();
                              }
                            });
                          });
                    })),
                //Academic Class End
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            selectCls == true
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FutureBuilder<DailyAttendanceModel>(
                            future: fetchDailyAttnd(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                print("snapshot $snapshot");
                                return DataTable(
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => offWhite),
                                  dataRowHeight: 50.h,
                                  columnSpacing: 10.w,
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: customText(
                                            "ID", dark, 17.0, FontWeight.w700)),
                                    DataColumn(
                                        label: customText("Name", dark, 17.0,
                                            FontWeight.w700)),
                                    DataColumn(
                                        label: customText(
                                            "ST", dark, 17.0, FontWeight.w700))
                                  ],
                                  rows: snapshot.data.attendances
                                      .map<DataRow>((e) {
                                    return DataRow(cells: [
                                      DataCell(customText(
                                          e.studentId.toString(),
                                          dark,
                                          14.0,
                                          FontWeight.w700)),
                                      DataCell(customText(
                                          e.studentName.toString(),
                                          dark,
                                          14.0,
                                          FontWeight.w700)),
                                      DataCell(customText(e.status.toString(),
                                          dark, 14.0, FontWeight.w700)),
                                    ]);
                                  }).toList(),
                                );
                              } else if (snapshot.hasData == null) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Center(
                                    child:
                                        Text("Please select date and class"));
                              }
                            }),
                      ),
                    ),
                  )
                : Container(
                    child: Text("Select Date and Class"),
                  )
          ],
        ), 
     bottomNavigationBar: CustomNavigationBar(),
        );
  }

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
                  if (selectCls && dateController != null) {
                             
                                fetchDailyAttnd();
                              }
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
