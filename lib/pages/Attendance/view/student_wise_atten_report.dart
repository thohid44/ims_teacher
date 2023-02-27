import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';

import 'package:imsteacher/pages/Attendance/model/student_wise_atten_model.dart';
import 'package:imsteacher/pages/Home/custom_navigation_bar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

import '../../../Utils/Constrans/color.dart';

class StudentWishAttendence extends StatefulWidget {
  const StudentWishAttendence({super.key});

  @override
  State<StudentWishAttendence> createState() => _StudentWishAttendenceState();
}

class _StudentWishAttendenceState extends State<StudentWishAttendence> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Select Month"), value: "Select Month"),
      const DropdownMenuItem(child: Text("January"), value: "01"),
      const DropdownMenuItem(child: Text("February"), value: "02"),
      const DropdownMenuItem(child: Text("March"), value: "03"),
      const DropdownMenuItem(child: Text("April"), value: "04"),
      const DropdownMenuItem(child: Text("May"), value: "05"),
      const DropdownMenuItem(child: Text("Janu"), value: "06"),
      const DropdownMenuItem(child: Text("July"), value: "07"),
      const DropdownMenuItem(child: Text("August"), value: "08"),
      const DropdownMenuItem(child: Text("September"), value: "09"),
      const DropdownMenuItem(child: Text("Octorber"), value: "10"),
      const DropdownMenuItem(child: Text("November"), value: "11"),
      const DropdownMenuItem(child: Text("December"), value: "12"),
    ];
    return menuItems;
  }
List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Select Year"), value: "Select Year"),
      const DropdownMenuItem(child: Text("2023"), value: "2023"),
       const DropdownMenuItem(child: Text("2024"), value: "2024"),
         const DropdownMenuItem(child: Text("2025"), value: "2025"),
       const DropdownMenuItem(child: Text("2026"), value: "2025"),
     
    ];
    return menuItems;
  }
  String selectMonth = "Select Month";
  String selectYear = "Select Year";
final _box = GetStorage(); 
var url = ApiUrl.baseUrl; 
   fetchStudent() async {
     var token =  _box.read(LocalStoreKey.token);
  print(token);  
    try{
    
String url2 =
        '$url/student-wise-attendance?studentId=UHS2306A004&month=02&year=2023';

    var response = await ApiUrl.userClient.get(Uri.parse(url2), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token,
    });

    var data = json.decode(response.body);
print(data);
    if (response.statusCode == 200) {
      return StudentWiseAttenModel.fromJson(data);
    } else {
      return null;
    }
    }catch(e){
      print(e.toString()); 
    }
  }

  final TextEditingController _stdId = TextEditingController();
  String? month;
  var year;
  void initState() {
    fetchStudent();
    super.initState();
  }

  bool stdStatus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("STUDENT WISE ATTENDENCE"),
        ),
        body: ListView(
          children: [
            
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 45.h,
                    alignment: Alignment.center,
                    width: 150.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: Colors.grey)),
                    child: DropdownButton(
                        underline: SizedBox(),
                        value: selectMonth,
                        style: TextStyle(color: Colors.black, fontSize: 17.sp),
                        onChanged: (String? newValue) {
                          selectMonth = newValue!;
                          setState(() {
                            if (selectMonth.isNotEmpty) {
                              month = selectMonth; 
                              print(month); 
                              //  isLoading=true;
                            }
                          });
                        },
                        items: dropdownItems)),
                Container(
                    height: 45.h,
                    alignment: Alignment.center,
                    width: 150.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: Colors.grey)),
                    child: DropdownButton(
                        underline: SizedBox(),
                        value: selectYear,
                        style: TextStyle(color: Colors.black, fontSize: 17.sp),
                        onChanged: (String? newValue) {
                          selectYear = newValue!;
                          setState(() {
                            if (selectYear.isNotEmpty) {
                              //  isLoading=true;
                            }
                          });
                        },
                        items: dropdownItem)),
              ],
            ),
            SizedBox(height: 10,), 
Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 220.w,
                    height: 40.h,
                    child: TextFormField(
                      controller: _stdId,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "STUDENT ID",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      fetchStudent();
                      setState(() {
                        print(_stdId);
                        stdStatus = true;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                        decoration: const BoxDecoration(color: primaryColor),
                        child: Icon(
                          Icons.search,
                          size: 25.w,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            stdStatus == true ? 
Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: fetchStudent(),
                    builder: ((context, AsyncSnapshot snapshot) {
                      var data = snapshot.data.attendances;
                      if (data !=null) {
                        var val = 'L';
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 10.w, bottom: 5.h),
                                  alignment: Alignment.centerLeft,
                                  child: customText(
                                      "Student Id: ${snapshot.data.studentId.toString()}",
                                      dark,
                                      16.0,
                                      FontWeight.bold)),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 10.w, bottom: 5.h),
                                  alignment: Alignment.centerLeft,
                                  child: customText(
                                      "Name: ${snapshot.data!.studentName.toString()}",
                                      dark,
                                      16.0,
                                      FontWeight.bold)),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 10.w, bottom: 5.h),
                                  alignment: Alignment.centerLeft,
                                  child: customText(
                                      "Section: ${snapshot.data!.section.toString()}",
                                      dark,
                                      16.0,
                                      FontWeight.bold)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _countClassStatus("P:", data, "P", Pcolor),
                                  _countClassStatus("A:", data, "A", Acolor),
                                  _countClassStatus("D:", data, "D", Dcolor),
                                  _countClassStatus("L:", data, "L", Lcolor),
                                  _countClassStatus("H:", data, "H", Hcolor),
                                  _countClassStatus("LE:", data, "LE", LEcolor),
                                  _countClassStatus("E:", data, "E", Ecolor),
                                  _countClassStatus("W:", data, "W", Wcolor),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => offWhite),
                                    columnSpacing: 40.w,
                                    horizontalMargin: 10,
                                    dataRowHeight: 20.h,
                                    border: TableBorder.all(width: 1),
                                    columns: const <DataColumn>[
                                      DataColumn(label: Text("ID")),
                                      DataColumn(label: Text("Date")),
                                  
                                      DataColumn(label: Text("Status")),
                                    ],
                                    rows: snapshot.data.attendances
                                        .map<DataRow>(
                                          (e) => DataRow(cells: <DataCell>[
                                            DataCell(Text(e.id.toString())),
                                            DataCell(Text(e.date.toString())),
                                          
                                            DataCell(
                                                Text(e.attnStatus.toString()))
                                          ]),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customText("P - Present", Colors.green, 13.0,
                                      FontWeight.bold),
                                  customText("A - Absent", Colors.red, 13.0,
                                      FontWeight.bold),
                                  customText("D - Delay", Colors.purple, 13.0,
                                      FontWeight.bold),
                                  customText("L - Leave", Colors.lightBlue,
                                      13.0, FontWeight.bold),
                                  customText("H - Holiday", Colors.yellow, 16.0,
                                      FontWeight.bold),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customText("LE - Late & Early Leave",
                                      Colors.blue, 13.0, FontWeight.bold),
                                  customText("E - Early Leave",
                                      Colors.redAccent, 13.0, FontWeight.bold),
                                  customText("W - Weekly Off",
                                      Colors.blueAccent, 13.0, FontWeight.bold),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    })))
            :Center(child:Text("Please Select Month, Year and enter student Id")),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
        );
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget _countClassStatus(
      String value, List data, String element, Color color) {
    print(data);
    int count = 0;
    print("thohdi ${data.length}");

    //   for(int i=0; i<data.length; i++){
    //   if(data[i]['attnStatus']=='L') {

    //     print(count++);
    //   }

    // }
    data.forEach((e) {
      if (e.attnStatus == element) {
        var counts = count++;
        print(counts);
      }
    });
    return Container(
      child: Text(
        "$value ${count.toString()}",
        style: TextStyle(color: color),
      ),
    );
  }
}
// 