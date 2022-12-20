import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
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

    List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
  const  DropdownMenuItem(child: Text("Class Five"),value: "Academic Class"),
  const  DropdownMenuItem(child: Text("Class Five"),value: "five"),
   const DropdownMenuItem(child: Text("Class Six"),value: "six"),
   const DropdownMenuItem(child: Text("Class Seven"),value: "seven"),
   const DropdownMenuItem(child: Text("Class Eight"),value: "eight"),
  ];
  return menuItems;
}
String selectedValue = "Academic Class";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOBILE ATTENDENCE"),
        backgroundColor: primaryColor,
      ),
       body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
           
  Container(
    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
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
        });
      },
      items: dropdownItems
      )
           ),
             
   
               SizedBox(height: 10.h,),
            Table(
              
              border: TableBorder.all(width: 1.w), 
              columnWidths: {
                      0: FlexColumnWidth(4),
                     
                      1: FlexColumnWidth(5),
                      2:FlexColumnWidth(5),
                    
                    },  
              children: [
               const TableRow(
                  children: [
                    TableCell(child: Padding(
                      padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                      child: Text("ID",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                   
                    TableCell(child: Padding(
                          padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                      child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                    TableCell(child: Padding(
                           padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                      child: Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                    
                  ]
                ), 
            

                TableRow(
                  
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                      child: customText("S38", dark, 13.0, FontWeight.bold),
                    )),
                    
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                          child: customText("Amzad Mortuza", dark, 13.0, FontWeight.bold),
                        )),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                            child: Switch(
                              
                              value: status1, onChanged: (value){
                                    setState(() {
                                      status1 = value;
                                    });
                            }),
                          )),
                         
                  ]
                ),

                  
                  TableRow(
                  
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                      child: customText("S38", dark, 13.0, FontWeight.bold),
                    )),
                    
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                          child: customText("Amzad Mortuza", dark, 13.0, FontWeight.bold),
                        )),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                            child: Switch(
                              
                              value: status2, onChanged: (value){
                                    setState(() {
                                      status2 = value;
                                    });
                            }),
                          )),
                         
                  ]
                ),TableRow(
                  
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                      child: customText("S38", dark, 13.0, FontWeight.bold),
                    )),
                    
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                          child: customText("Amzad Mortuza", dark, 13.0, FontWeight.bold),
                        )),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                            child: Switch(
                              
                              value: status3, onChanged: (value){
                                    setState(() {
                                   status3 =value; 
                                     
                                    });
                            }),
                          )),
                         
                  ]
                ),
                   
              ],
            ),
            SizedBox(height: 20.h,), 


              Container(
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                alignment: Alignment.center,
                height: 50.h, width: 200.w,


                decoration: BoxDecoration(
                  color: Colors.green, 
                  
                ),
                child: customText("Save Attendance", Colors.white, 18.0, FontWeight.bold),
              )
           
          ],
        ),
      )
    );
  }
}