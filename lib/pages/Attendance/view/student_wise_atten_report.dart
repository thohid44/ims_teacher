import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

import '../../../Utils/Constrans/color.dart';

class StudentWishAttendence extends StatefulWidget {
  const StudentWishAttendence({super.key});

  @override
  State<StudentWishAttendence> createState() => _StudentWishAttendenceState();
}

class _StudentWishAttendenceState extends State<StudentWishAttendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("STUDENT WISE ATTENDENCE"),
      ),
       body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
           Container(
          
            alignment: Alignment.center,
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical:10.h),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText:"STUDENT ID",
                enabledBorder: OutlineInputBorder(
                  
                ), 
                focusedBorder: OutlineInputBorder(
                  
                )
              ),

            ),
           ), 

            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
              alignment: Alignment.centerLeft,
              child: customText("Student Id: 316087", dark, 16.0, FontWeight.bold)),
             Container(
                       padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
              alignment: Alignment.centerLeft,
              child: customText("Name: Al Amin", dark, 16.0, FontWeight.bold)),
              Container(
                         padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
              alignment: Alignment.centerLeft,
                child: customText("Class: Nine A Business Studies", dark, 16.0, FontWeight.bold)),


            SizedBox(height: 10.h,),
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText("P:20", Colors.green, 16.0, FontWeight.bold),
         customText("A:1", Colors.red, 16.0, FontWeight.bold),
          customText("D:1", Colors.purple, 16.0, FontWeight.bold),
           customText("L:1", Colors.lightBlue, 16.0, FontWeight.bold),
            customText("H:1", Colors.yellow, 16.0, FontWeight.bold),
            customText("LE:1",Colors.blue , 16.0, FontWeight.bold),
            customText("E:1", Colors.redAccent, 16.0, FontWeight.bold),
            customText("W:4", Colors.blueAccent, 16.0, FontWeight.bold),
      ],
     ), 
               SizedBox(height: 10.h,),
            Table(
              
              border: TableBorder.all(width: 1.w), 
              columnWidths: {
                      0: FlexColumnWidth(4),
                     
                      1: FlexColumnWidth(5),
                      2:FlexColumnWidth(5),
                      3:FlexColumnWidth(2)
                    },  
              children: [
               const TableRow(
                  children: [
                    TableCell(child: Padding(
                      padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                      child: Text("Date",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                   
                    TableCell(child: Padding(
                          padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                      child: Text("In",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                    TableCell(child: Padding(
                           padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                      child: Text("Out",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                     TableCell(child: Padding(
                            padding: const EdgeInsets.only(left:8, top: 8, bottom: 8),
                       child: Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
                     ))
                  ]
                ), 
            

                TableRow(
                  
                  children: [
                    TableCell(child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                      child: customText("12-12-2022", dark, 13.0, FontWeight.bold),
                    )),
                    
                        TableCell(child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                          child: customText("9:25:00 AM", dark, 13.0, FontWeight.bold),
                        )),
                          TableCell(child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                            child: customText("2:30:55 PM ", dark, 13.0, FontWeight.bold),
                          )),
                            TableCell(child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                              child: customText("P", dark, 13.0, FontWeight.bold),
                            ))
                  ]
                ),

                   TableRow(
                  
                  children: [
                    TableCell(child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                      child: customText("12-12-2022", dark, 13.0, FontWeight.bold),
                    )),
                    
                        TableCell(child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                          child: customText("9:25:00 AM", dark, 13.0, FontWeight.bold),
                        )),
                          TableCell(child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                            child: customText("2:30:55 PM ", dark, 13.0, FontWeight.bold),
                          )),
                            TableCell(child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                              child: customText("P", dark, 13.0, FontWeight.bold),
                            ))
                  ]
                ),
                   TableRow(
                  
                  children: [
                    TableCell(child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                      child: customText("12-12-2022", dark, 13.0, FontWeight.bold),
                    )),
                    
                        TableCell(child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                          child: customText("9:25:00 AM", dark, 13.0, FontWeight.bold),
                        )),
                          TableCell(child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                            child: customText("2:30:55 PM ", dark, 13.0, FontWeight.bold),
                          )),
                            TableCell(child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:5, vertical: 3),
                              child: customText("P", dark, 13.0, FontWeight.bold),
                            )),
                            
                  ]
                ), 
                  
                   
              ],
            ),

            SizedBox(height: 15.h,), 
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText("P - Present", Colors.green, 13.0, FontWeight.bold),
         customText("A - Absent", Colors.red, 13.0, FontWeight.bold),
          customText("D - Delay", Colors.purple, 13.0, FontWeight.bold),
              customText("L - Leave", Colors.lightBlue, 13.0, FontWeight.bold),
     
      customText("H - Holiday", Colors.yellow, 16.0, FontWeight.bold),
      ],
     ), 
  SizedBox(height: 5.h,), 
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      
            customText("LE - Late & Early Leave",Colors.blue , 13.0, FontWeight.bold),
            customText("E - Early Leave", Colors.redAccent, 13.0, FontWeight.bold),
            customText("W - Weekly Off", Colors.blueAccent, 13.0, FontWeight.bold),
      ],
     )
          ],
        ),
      ), 
  bottomNavigationBar: Container(
    
    child: CurvedNavigationBar(
      backgroundColor:Colors.white, 
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