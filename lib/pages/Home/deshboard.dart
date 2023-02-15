import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Attendance/view/daily_attendance_page.dart';
import 'package:imsteacher/pages/Attendance/view/mobile_attendance_page.dart';
import 'package:imsteacher/pages/Attendance/view/student_wise_atten_report.dart';
import 'package:imsteacher/pages/Dairy/view/add_new_diary_page.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_page.dart';
import 'package:imsteacher/pages/Exam%20Routine/views/exam_routine_page.dart';
import 'package:imsteacher/pages/Home/drawer.dart';
import 'package:imsteacher/pages/Leave/view/add_student_leave.dart';
import 'package:imsteacher/pages/Result_Sheet/views/result_sheet.dart';
import 'package:imsteacher/pages/login/controller/auth_controller.dart';


class DeashBoard extends StatefulWidget {
  const DeashBoard({super.key});

  @override
  State<DeashBoard> createState() => _DeashBoardState();
}

class _DeashBoardState extends State<DeashBoard> {
  final AuthenticationManager authManager = Get.find<AuthenticationManager>();
  @override
  Widget build(BuildContext context) {
    print(authManager.getToken());
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: primaryColor,
        title:const Text("DASHBOARD", 
      
      ), centerTitle: true, ),
     drawer: AppDrawer(),
      body: ListView(
             scrollDirection: Axis.vertical,
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
                  child: deshboardItem(title: "Daily Attendence",imageLInk:"assets/attendance.png")), 
                  
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>MobileAttendancePage()));
                  },
                  child: deshboardItem(title:"Mobile Attendance",imageLInk:"assets/mobile.png")), 
                InkWell(
                     onTap: (){
                      print("object"); 
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>StudentWishAttendence()));
                  },
                  child: deshboardItem(title:"Student Wise Report",imageLInk:"assets/student.png")), 
              
                
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
                  child: deshboardItem(title:"Daily Diary",imageLInk:"assets/diary.png")), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                  },
                  child: deshboardItem(title:"Add New Diary",imageLInk:"assets/add_diary.png")), 
                InkWell(
                     onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                     Get.snackbar(
              "",
               "Coming Soon",
               colorText: Colors.white,
               backgroundColor: Colors.purple,
               snackPosition: SnackPosition.BOTTOM,
                 
               );
                  },
                  child: deshboardItem(title: "Comming Soon",)), 
                
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
                  
                    //Navigator.push(context, MaterialPageRoute(builder:(_)=>AddStudentLeave()));
                 
                       Get.snackbar(
              "Add Leave",
               "Coming Soon",
               colorText: Colors.white,
               backgroundColor: Colors.purple,
               snackPosition: SnackPosition.BOTTOM,
                 
               );

                  },
                  child: deshboardItem(title:"Add Leave",imageLInk: "assets/leave.png")), 
                InkWell(
                     onTap: (){
                  //  Navigator.push(context, MaterialPageRoute(builder:(_)=>StudentWishAttendence()));
                           Get.snackbar(
              "Leave Categories",
               "Coming Soon",
               colorText: Colors.white,
               backgroundColor: Colors.purple,
               snackPosition: SnackPosition.BOTTOM,
                 
               );
                  },
                  child: deshboardItem(title:"Leave Categories",imageLInk: "assets/add_leave.png")), 
                InkWell(
                     onTap: (){
                   // Navigator.push(context, MaterialPageRoute(builder:(_)=>MobileAttendancePage()));
                            Get.snackbar(
              "Leave Report",
               "Coming Soon",
               colorText: Colors.white,
               backgroundColor: Colors.purple,
               snackPosition: SnackPosition.BOTTOM,
                 
               );
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
                  child: deshboardItem(title:"Exam Routine",imageLInk: "assets/routine.png",)), 
                // InkWell(
                //      onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder:(_)=>AddNewDiaryPage()));
                //   },
                //   child: deshboardItem(title:"Exam Schedule",imageLInk: "assets/routine.png",)), 
                InkWell(
                     onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>ResultSheet()));
                  },
                  child: deshboardItem(title: "Exam Result",imageLInk: "assets/result.png",)), 
                
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
  String? imageLInk;
  int? height; 
  int? width;
   deshboardItem({
    Key? key, this.title,  this.imageLInk , this.height, this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:14.0,),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
             color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
        
            // boxShadow:const [
            //   BoxShadow(
            //     color: primaryColor,
            //    blurStyle: BlurStyle.inner,
            //    blurRadius: 20.0,
            //   offset: Offset(2, 2)
            // )
            // ]
          ),
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
             SizedBox(height: 10.h,),
              Container(
                height: 40.h,
                width: 60.w,
                child: imageLInk==null?Text("No Image"):Image.asset(imageLInk.toString(), ),
              ), 
              SizedBox(height: 10.h,),
              Text(title.toString(), 
              style: TextStyle(fontFamily: "Roboto", 
              fontSize: 13.sp, fontWeight: FontWeight.w700, 
              color: Colors.black
              ),
              textAlign: TextAlign.center,
              )
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