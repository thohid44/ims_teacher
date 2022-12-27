
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/model/daily_attendance_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:intl/intl.dart';

class DailyAttendancePage extends StatefulWidget {
  const DailyAttendancePage({super.key});

  @override
  State<DailyAttendancePage> createState() => _DailyAttendancePageState();
}

class _DailyAttendancePageState extends State<DailyAttendancePage>
     {

 Future<DailyAttendanceModel> fetchDailyAttnd() async {
  String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient.get(
        Uri.parse(
            "https://demo.webpointbd.com/api/daily-attendance?date=$date&class_id=$clsId"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ApiUrl.token,
        });
    var jsonData = json.decode(response.body);
 
    if (response.statusCode == 200) {
   return  DailyAttendanceModel.fromJson(jsonData);
    } 
      return  DailyAttendanceModel.fromJson(jsonData);
  }
  bool selectCls = false; 
  bool seletcdate = false; 
  String clsId='';
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
  const  DropdownMenuItem(child: Text("Select Class"),value: "Select Class"),
  const  DropdownMenuItem(child: Text("Class One"),value: "1"),
   const DropdownMenuItem(child: Text("Class Two"),value: "2"),
   const DropdownMenuItem(child: Text("Class Three"),value: "3"),
   const DropdownMenuItem(child: Text("Class Four"),value: "4"),
  ];
  return menuItems;
}
String selectedValue = "Select Class";
  @override
  void initState() {
    
    super.initState();

  }

  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
  appBar: AppBar(
          title: const Text("DAILY ATTENDENCE"),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),

      body: Column(
        children: [
          SizedBox(height: 10.h,), 
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
            width: 160.w,
            height: 45.h,
             child: _buildDatePicker()
           ),
           Container(
            height: 45.h,
            alignment: Alignment.center,
            width: 150.w,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: Colors.grey)
            ),
             child: DropdownButton(
              underline: SizedBox(),
      value: selectedValue,
      style: TextStyle(color: Colors.black,fontSize: 17.sp),
      onChanged: (String? newValue){
        setState(() {
          selectedValue = newValue!;
          if(selectedValue.isNotEmpty && dateController.text.isNotEmpty)
       {
          clsId = selectedValue;
           date=selectedDate.toString();
           selectCls = true; 
          fetchDailyAttnd();
       }
        });
      },
      items: dropdownItems
      )
           ),
            ],
           ) ,
             SizedBox(height: 19.h,), 
           selectCls==true? Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: fetchDailyAttnd(),
                builder:(context,snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  return 
                  DataTable(
                    border: TableBorder.all(width: 1.w),
                    dataRowHeight: 50.h,
                      columnSpacing: 15.w,
                      columns: [
                      DataColumn(label:customText("ID", dark, 17.0, FontWeight.w700)),
                          DataColumn(label:customText("Name", dark, 17.0, FontWeight.w700)),
                          DataColumn(label:customText("IN", dark, 17.0, FontWeight.w700)),
                          DataColumn(label:customText("Out", dark, 17.0, FontWeight.w700)),
                          DataColumn(label:customText("ST", dark, 17.0, FontWeight.w700))
                    ], rows:snapshot.data!.attendances!.map((e) {
                      return DataRow(cells: [
                          DataCell(customText(e.studentId.toString(), dark, 15.0, FontWeight.w400)),
                          DataCell(customText(e.studentName.toString(), dark, 15.0, FontWeight.w400)),
                          DataCell(customText(e.inTime.toString(), dark, 15.0, FontWeight.w400)),
                          DataCell(customText(e.outTime.toString(), dark, 15.0, FontWeight.w400)),
                          DataCell(customText(e.status.toString(), dark, 15.0, FontWeight.w400)),
                        ]);
                    }).toList(),
              );
                }else if(snapshot.hasData == null){
                  return Center(child:CircularProgressIndicator());
                }
               else{
                 return Center(child:Text("Please select date and class"));
               }
              }),
            ),
          ):Container(child: Text("Select Date and Class"),)
        ],
      )
    );
  }

  
   final TextEditingController dateController = TextEditingController(); 
 
  DateTime selectedDate = DateTime.now(); 
  late String date; 
  late String weekDay; 
  Widget _buildDatePicker(){
    
    return TextFormField(
    controller: dateController,
    readOnly: true,
    textAlign: TextAlign.center,
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.all(8.0), 
      suffixIcon: Icon(Icons.date_range, color: dark,), 
      hintText: "YYYY-MM-DD", 
      hintMaxLines: 1, 
      hintStyle: TextStyle(fontSize: 15.0), 
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ), 
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ), 

      
    ),
    onTap:() async{
        final pickedDate = await selectDate(
        context:context, 
        initialDate:selectedDate,
        allowedDays:_allowedDays 
         );
      if(pickedDate != null && pickedDate !=selectedDate){
setState(() {
  selectedDate = pickedDate; 
  dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate); 
  print("thohid ${dateController.text}");
});
      }
      }
    );
  }
    bool _allowedDays(DateTime day) {
    if ((day.isBefore(DateTime.now()))) {
      return true;
    }
    return false;
  }
  selectDate({
 required BuildContext context,
  required DateTime initialDate,
  required allowedDays
}) async {
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
            style: TextButton.styleFrom(
           
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return selected;
}
}

