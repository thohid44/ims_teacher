import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/view/daily_attendance_page.dart';
import 'package:imsteacher/pages/Attendance/view/mobile_attendance_page.dart';
import 'package:imsteacher/pages/Attendance/view/student_wise_atten_report.dart';
import 'package:imsteacher/pages/Dairy/view/add_new_diary_page.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_page.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class DeashBoard extends StatefulWidget {
  const DeashBoard({super.key});

  @override
  State<DeashBoard> createState() => _DeashBoardState();
}

class _DeashBoardState extends State<DeashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("DASHBOARD", 
      
      ), centerTitle: true, ),

      body: ListView(

        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w,right: 10.w, 
            top: 10.h, bottom: 10.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 2, 
                color: dark
              ))
            ),
            child: Text("Attendance",style: TextStyle(
              fontSize: 17.sp, 
              fontWeight: FontWeight.bold, 
              color: dark
            ),),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
        
            height: 100.h,
           
            child: ListView(
              scrollDirection: Axis.horizontal, 
              children: [
                  InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>DailyAttendancePage()));
                  },
                  child: deshboardItem(title: "Daily Attendence",)), 
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>MobileAttendancePage()));
                  },
                  child: deshboardItem(title:"Mobile Attendance",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>StudentWishAttendence()));
                  },
                  child: deshboardItem(title:"Student Wise Report",)), 
              
                
              ],
            ),
          ), 
          SizedBox(height: 10.h,), 

             Container(
            margin: EdgeInsets.only(left: 10.w,right: 10.w, 
            top: 10.h, bottom: 10.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 2, 
                color: dark
              ))
            ),
            child: Text("Diary                    ",style: TextStyle(
              fontSize: 17.sp, 
              fontWeight: FontWeight.bold, 
              color: dark
            ),),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
        
            height: 100.h,
           
            child: ListView(
              scrollDirection: Axis.horizontal, 
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>DairyPage()));
                  },
                  child: deshboardItem(title:"Daily Diary",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                  },
                  child: deshboardItem(title:"Add New Diary",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                  },
                  child: deshboardItem(title: "X",)), 
                
              ],
            ),
          ),

          SizedBox(height: 10.h,), 

             Container(
            margin: EdgeInsets.only(left: 10.w,right: 10.w, 
            top: 10.h, bottom: 10.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 2, 
                color: dark
              ))
            ),
            child: Text("Leave Management ",style: TextStyle(
              fontSize: 17.sp, 
              fontWeight: FontWeight.bold, 
              color: dark
            ),),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
        
            height: 100.h,
           
            child: ListView(
              scrollDirection: Axis.horizontal, 
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>MobileAttendancePage()));
                  },
                  child: deshboardItem(title:"Add Leave",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>StudentWishAttendence()));
                  },
                  child: deshboardItem(title:"Leave Categories",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>MobileAttendancePage()));
                  },
                  child: deshboardItem(title: "Leave Report",)), 
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class deshboardItem extends StatelessWidget {
  String? title; 
   deshboardItem({
    Key? key, this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: offWhite
        ),
        height: 80.h,
        width: 80.w,
        child: customText(title.toString(), dark, 15.0, FontWeight.bold),
      ),
    );
  }
}