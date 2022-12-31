import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/model/student_wise_atten_model.dart';
import 'package:imsteacher/pages/Attendance/view/daily_attendance_page.dart';
import 'package:imsteacher/pages/Attendance/view/mobile_attendance_page.dart';
import 'package:imsteacher/pages/Attendance/view/student_wise_atten_report.dart';
import 'package:imsteacher/pages/Dairy/view/add_new_diary_page.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_page.dart';
import 'package:imsteacher/pages/Exam/views/exam_routine_page.dart';
import 'package:imsteacher/pages/Leave/view/add_student_leave.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

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
        title:const Text("DASHBOARD", 
      
      ), centerTitle: true, ),
     drawer: Container(
      margin: EdgeInsets.only(right: 40.h),
       child: ClipPath(
      clipper:LDOvalRightBorderClipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
         child: Drawer(
          backgroundColor: Color(0xff1A1A1A),
           child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                padding: EdgeInsets.zero,
                child: ListView(
             children: [
              DrawerHeader(child:Container(
                margin: EdgeInsets.only(right: 25),
                child: Center(
                  child: Icon(Icons.abc, color: Colors.white,),
                ),
              )),
              ListTile(
                   onTap: () {
                Get.to(DeashBoard());
                   },
                      title: const Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    ),
                     ListTile(
                   
                      title: const Text(
                      'Profile',
                      style:
                       TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    onTap: (){

                    },
                    ),
                       ListTile(
                   
                      title: const Text(
                      'Change Password',
                      style:
                       TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    onTap: (){

                    },
                    ),
                            ListTile(
                   
                      title: const Text(
                      'LogOut',
                      style:
                       TextStyle(fontSize: 18,fontFamily: 'Roboto',
                      
                      fontWeight: FontWeight.bold,
                       color: Colors.white) ,
                    ),
                    onTap: (){

                    },
                    ),
             ],
                ),
              )
            ],
           ),
         ),
       ),
     ),
      body: ListView(

        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w,right: 10.w, 
         
            top: 10.h, bottom: 10.h),
               padding:EdgeInsets.only(bottom: 5.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 2, 
                color: dark
              ))
            ),
            child: Text("Attendance",style: TextStyle(
              fontSize: 17.sp, 
              fontWeight: FontWeight.bold, 
              fontFamily: 'Roboto',
              color: dark
            ),),
          ),
        
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
        
            height: 120.h,
           
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
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>AddStudentLeave()));
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
            child: Text("Exam ",style: TextStyle(
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
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>ExamRoutinePage()));
                  },
                  child: deshboardItem(title:"Exam Routine",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                  },
                  child: deshboardItem(title:"Exam Schedule",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                  },
                  child: deshboardItem(title: "X",)), 
                
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
      padding:  EdgeInsets.only(left:8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
           color: Color(0xffD6D6D6),
          borderRadius: BorderRadius.circular(20.r),
      
          // boxShadow: const[
          //   BoxShadow(
          //    blurStyle: BlurStyle.inner,
          //    blurRadius: 20.0,
          //   offset: Offset(1, 1)
          // )
          // ]
        ),
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
           SizedBox(height: 10.h,),
            Icon(Icons.class_outlined,size: 40, color:Colors.black,),
            SizedBox(height: 10.h,),
            customText(title.toString(), dark, 15.0, FontWeight.bold),
          ],
        )
      ),
    );
  }
}


class LDOvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4), size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}