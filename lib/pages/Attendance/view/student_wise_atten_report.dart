import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/pages/Attendance/model/student_wise_atten_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

import '../../../Utils/Constrans/color.dart';

class StudentWishAttendence extends StatefulWidget {
  const StudentWishAttendence({super.key});

  @override
  State<StudentWishAttendence> createState() => _StudentWishAttendenceState();
}

class _StudentWishAttendenceState extends State<StudentWishAttendence> {
  Future<StudentWiseAttenModel> fetchStudent() async {
    String url =
        'https://demo.webpointbd.com/api/student-wise-attendance?studentId=S10575';

    var response = await ApiUrl.userClient.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer' + ApiUrl.token,
    });

    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return StudentWiseAttenModel.fromJson(data);
    } else {
      return StudentWiseAttenModel.fromJson(data);
    }
  }

  final TextEditingController _stdId = TextEditingController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("STUDENT WISE ATTENDENCE"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: fetchStudent(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 10.h),
                          child: TextFormField(
                            controller: _stdId,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                hintText: "STUDENT ID",
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                            alignment: Alignment.centerLeft,
                            child: customText(
                                "Student Id: ${snapshot.data!.studentId.toString()}",
                                dark,
                                16.0,
                                FontWeight.bold)),
                        Container(
                            padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                            alignment: Alignment.centerLeft,
                            child: customText(
                                "Name: ${snapshot.data!.studentName.toString()}",
                                dark,
                                16.0,
                                FontWeight.bold)),
                        Container(
                            padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                                "P: ${snapshot.data!.studentName.toString()}",
                                Colors.green,
                                16.0,
                                FontWeight.bold),
                            customText(
                                "A:1", Colors.red, 16.0, FontWeight.bold),
                            customText(
                                "D:1", Colors.purple, 16.0, FontWeight.bold),
                            customText(
                                "L:1", Colors.lightBlue, 16.0, FontWeight.bold),
                            customText(
                                "H:1", Colors.yellow, 16.0, FontWeight.bold),
                            customText(
                                "LE:1", Colors.blue, 16.0, FontWeight.bold),
                            customText(
                                "E:1", Colors.redAccent, 16.0, FontWeight.bold),
                            customText("W:4", Colors.blueAccent, 16.0,
                                FontWeight.bold),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 300.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                                columnSpacing: 10.w,
                                horizontalMargin: 10,
                                dataRowHeight: 20.h,
                                border: TableBorder.all(width: 1),
                                columns: const [
                                  DataColumn(label: Text("ID")),
                                  DataColumn(label: Text("Date")),
                                  DataColumn(label: Text("In")),
                                  DataColumn(label: Text("Out")),
                                  // DataColumn(label: Text("Status")),
                                ],
                                rows: snapshot.data!.attendances!
                                    .map((e) => DataRow(cells: [
                                          DataCell(Text(e.id.toString())),
                                          DataCell(Text(e.date.toString())),
                                          DataCell(Text("10:10:10")),
                                          DataCell(Text(e.inTime.toString())),
                                          // DataCell(Text(e.outTime.toString())),
                                          // DataCell(
                                          //     Text(e.attnStatus.toString()))
                                        ]))
                                    .toList()),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText("P - Present", Colors.green, 13.0,
                                FontWeight.bold),
                            customText("A - Absent", Colors.red, 13.0,
                                FontWeight.bold),
                            customText("D - Delay", Colors.purple, 13.0,
                                FontWeight.bold),
                            customText("L - Leave", Colors.lightBlue, 13.0,
                                FontWeight.bold),
                            customText("H - Holiday", Colors.yellow, 16.0,
                                FontWeight.bold),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText("LE - Late & Early Leave", Colors.blue,
                                13.0, FontWeight.bold),
                            customText("E - Early Leave", Colors.redAccent,
                                13.0, FontWeight.bold),
                            customText("W - Weekly Off", Colors.blueAccent,
                                13.0, FontWeight.bold),
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }))),
      bottomNavigationBar: Container(
        child: CurvedNavigationBar(
          backgroundColor: Colors.white,
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: primaryColor,
          buttonBackgroundColor: primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
}
