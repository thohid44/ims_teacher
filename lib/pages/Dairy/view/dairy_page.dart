import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';
import 'package:imsteacher/pages/Dairy/Controller/Dairies_Controllder.dart';
import 'package:imsteacher/pages/Dairy/model/all_dairy_model.dart';
import 'package:imsteacher/pages/Dairy/view/add_new_diary_page.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_details_page.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:intl/intl.dart';

class DairyPage extends StatefulWidget {
  const DairyPage({super.key});

  @override
  State<DairyPage> createState() => _DairyPageState();
}

class _DairyPageState extends State<DairyPage> {
  String selectedValue = "Academic Class";

  AllDairyModel? _allDairyModel;
  String? classValue;

  var url = ApiUrl.baseUrl;
  final _box = GetStorage();
  Future<AllDairyModel?> fetchAllDairy() async {
    var token = _box.read(LocalStoreKey.token);
    print(token);

    String url2 =
        '$url/teacher-diaries?date=${dateController.text}&academic_class_id=$selectedValue';

    var response = await ApiUrl.userClient.get(Uri.parse(url2), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token,
    });

    var data = json.decode(response.body);
    print("diary23 $data");
    if (response.statusCode == 200) {
      return AllDairyModel.fromJson(data);
    } else {
      return AllDairyModel.fromJson(data);
    }
  }

  void initState() {
    super.initState();
  }

  bool isLoading = true;
  String id = '';
  @override
  Widget build(BuildContext context) {
    var _con = Get.put(TakeAttendController());
    _con.getAcademicCls();
    _con.classList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "DAILY DAIRY",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(width: 160.w, height: 45.h, child: _buildDatePicker()),
          SizedBox(
            height: 15.h,
          ),
          Container(
              height: 40.h,
              alignment: Alignment.center,
              width: 230.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Colors.grey)),
              child: GetBuilder<TakeAttendController>(builder: (context) {
                return DropdownButton(
                    hint: Text("Select Class "),
                    underline: SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: classValue,
                    items: _con.classList
                        .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(
                                "${e.name} ${e.id}",
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                        print(selectedValue);
                        print(selectedDate);
                        if (selectedValue.isNotEmpty &&
                            dateController.text.isNotEmpty) {
                          id = selectedValue;
                          isLoading = true;
                          fetchAllDairy();
                        }
                      });
                    });
              })),
          SizedBox(
            height: 30.h,
          ),
          Container(
              height: 600.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: isLoading == true
                  ? FutureBuilder(
                      future: fetchAllDairy(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: customText(
                                      "Class: ${snapshot.data!.allDairyModelClass.toString()}",
                                      dark,
                                      17.0,
                                      FontWeight.bold)),
                              SizedBox(
                                height: 7.h,
                              ),
                              Center(
                                  child: customText(
                                      "Group: ${snapshot.data!.group.toString()}",
                                      dark,
                                      17.0,
                                      FontWeight.bold)),
                              SizedBox(
                                height: 7.h,
                              ),
                              Center(
                                  child: customText(
                                      "Section: ${snapshot.data!.section.toString()}",
                                      dark,
                                      17.0,
                                      FontWeight.bold)),
                              SizedBox(
                                height: 7.h,
                              ),
                              Center(
                                  child: customText(
                                      "Date: ${snapshot.data!.date.toString()}",
                                      dark,
                                      17.0,
                                      FontWeight.bold)),
                              SizedBox(
                                height: 30.h,
                              ),
                              Container(
                                height: 400.h,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.diaries!.length,
                                  itemBuilder: ((context, index) {
                                    return Card(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(8.0),
                                        child: ListTile(
                                          tileColor: offWhite,
                                          title: Text(
                                            snapshot
                                                .data!.diaries![index].subject
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            snapshot.data!.diaries![index].diary
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () {
                                            String id = snapshot
                                                .data!.diaries![index].id
                                                .toString();

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DairyDetailsPage(
                                                            id: id)));
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          );
                        }

                        return const Center(
                          child: Text("Select Date and Class"),
                        );
                      }))
                  : Center(
                      child: Text("Loading..."),
                    )),
        ],
      ),
    );
  }

  final TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String date = '';
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
              print(" Thohid $selectedDate");
              dateController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              print(" Thohid ${dateController.text}");
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



// onChanged: (String? newValue){
//          selectedValue = newValue!;
//         setState(() {
//            if(selectedValue.isNotEmpty && dateController.text.isNotEmpty){
//            id=selectedValue; 
//           isLoading=true;     
//           fetchAllDairy();

//            }
  

//         });
//       },