import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Exam/model/exam_routine_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class ExamRoutinePage extends StatefulWidget {
  const ExamRoutinePage({super.key});

  @override
  State<ExamRoutinePage> createState() => _ExamRoutinePageState();
}

class _ExamRoutinePageState extends State<ExamRoutinePage> {

   Future<ExamRoutineModel> fetchRoutine() async {
  String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient.get(
        Uri.parse(
            "https://demo.webpointbd.com/api/exam-routine?academic_class_id=1&exam_id=12"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ApiUrl.token,
        });
    var jsonData = json.decode(response.body);
   print(jsonData);
    if (response.statusCode == 200) {
   return  ExamRoutineModel.fromJson(jsonData);
    } 
      return  ExamRoutineModel.fromJson(jsonData);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
       appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("Exam Routine",
      
      ), centerTitle: true, ),

    body: FutureBuilder(
      future: fetchRoutine(),
      builder: (context,AsyncSnapshot snapshot) {
        return ListView(
          children: [
            SizedBox(height: 10.h,), 
            Container(
           
              alignment: Alignment.center,
              width: double.infinity,
              child: customText(snapshot.data!.examRoutineClass.toString()+'  '+snapshot.data!.section.toString(), dark, 17.0, FontWeight.bold),
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
                  itemCount: 2,
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
                            decoration:const BoxDecoration(
                              color: offWhite
                            ),
                            child: customText(snapshot.data.routine[index].weekday.toString(), dark, 15.0, FontWeight.w700),
                          ), 
                             Container(
                                 height: 46.h,
                             alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                            decoration: const BoxDecoration(
                              color: offWhite
                            ),
                            child: customText("${snapshot.data.routine[index].hours[0].start.toString()} \n ${snapshot.data.routine[index].hours[0].end.toString()}", dark, 12.0, FontWeight.w600),
                          ), 
              
                             Container(
                                 height: 46.h,
                             alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                            decoration:const BoxDecoration(
                              color: offWhite
                            ),
                            child: customText("${snapshot.data.routine[index].hours[0].subject.toString()} \n"+ "Marks:" +"${snapshot.data.routine[index].hours[0].mark.toString()}", dark, 13.0, FontWeight.w700),
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        );
      }
    ),

    ));
  }
}