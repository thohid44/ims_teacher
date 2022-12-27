import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class ExamRoutinePage extends StatefulWidget {
  const ExamRoutinePage({super.key});

  @override
  State<ExamRoutinePage> createState() => _ExamRoutinePageState();
}

class _ExamRoutinePageState extends State<ExamRoutinePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
       appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("DAILY DAIRY",
      
      ), centerTitle: true, ),

    body: ListView(
      children: [
        SizedBox(height: 10.h,), 
        Container(
       
          alignment: Alignment.center,
          width: double.infinity,
          child: customText("TEN SCIENCE A", dark, 17.0, FontWeight.bold),
        ),
         Container(
         
          alignment: Alignment.center,
          width: double.infinity,
          child: customText("FINAL EXAMINATION", dark, 17.0, FontWeight.bold),
        ),
     SizedBox(height: 20.h,), 
        Container(
          height: 500.h,
          child: Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                         height: 46.h,
                         alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: offWhite
                        ),
                        child: customText("01-06-22", dark, 15.0, FontWeight.w700),
                      ), 
                         Container(
                             height: 46.h,
                         alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: offWhite
                        ),
                        child: customText("10:00 \n 12:00", dark, 12.0, FontWeight.w600),
                      ), 
          
                         Container(
                             height: 46.h,
                         alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: offWhite
                        ),
                        child: customText("English 1st Paper \n Marks:100 ", dark, 13.0, FontWeight.w700),
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        )
      ],
    ),

    ));
  }
}