import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class DailyAttendancePage extends StatefulWidget {
  const DailyAttendancePage({super.key});

  @override
  State<DailyAttendancePage> createState() => _DailyAttendancePageState();
}

class _DailyAttendancePageState extends State<DailyAttendancePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("DAILY ATTENDANCE", primaryColor),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          
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
                  child: Text("ID",style: TextStyle(fontWeight: FontWeight.bold),),
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
                   child: Text("ST",style: TextStyle(fontWeight: FontWeight.bold),),
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
      )
            

      
    );
  }
}

class AttendanceModel{
  int? id; 
  String? name;
  String? inTime; 
  String? outTime; 
  String? st; 

}