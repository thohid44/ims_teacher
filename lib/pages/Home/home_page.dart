import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_page.dart';
import 'package:imsteacher/pages/daily%20Attendence/daily_attendance_page.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("DASHBOARD", primaryColor),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(crossAxisCount: 2,
        crossAxisSpacing: 25.w, 
        mainAxisSpacing: 25.h,
       
        
          children: [
            InkWell(
            onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyAttendancePage()));
            }),
              child: Container(
               
                 decoration: BoxDecoration(
                  color: offWhite, 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
               
                child: customText("ATTN", dark, 20.0, FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
              Container(
             
               decoration: BoxDecoration(
                color: offWhite, 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
             
              child: customText("LEAVE", dark, 20.0, FontWeight.bold),
                  )
                ],
              ),
            ),
              InkWell(
                    onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DairyPage()));
            }),
                child: Container(
                           
                 decoration: BoxDecoration(
                  color: offWhite, 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                           
                child: customText("DAIRY", dark, 20.0, FontWeight.bold),
                    )
                  ],
                ),
                          ),
              ),
              Container(
             
               decoration: BoxDecoration(
                color: offWhite, 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
             
              child: customText("EXAM", dark, 20.0, FontWeight.bold),
                  )
                ],
              ),
            ),
         
  
          ],
        ),
      )
    );
  }
}