import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Academic/model/academicClassesModel.dart';
import 'package:imsteacher/pages/Academic/model/examinationsModel.dart';
import 'package:imsteacher/pages/Exam/model/exam_routine_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class ExamRoutinePage extends StatefulWidget {
  const ExamRoutinePage({super.key});

  @override
  State<ExamRoutinePage> createState() => _ExamRoutinePageState();
}

class _ExamRoutinePageState extends State<ExamRoutinePage> {

  bool selectClass = false;

// get class 
String? classValue;
String? eaxmValue; 
   Future<ExamRoutineModel> fetchRoutine() async {
  String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient.get(
        Uri.parse(
            "https://demo.webpointbd.com/api/exam-routine?academic_class_id=$classValue&exam_id=$eaxmValue"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ApiUrl.token,
        });
    var jsonData = json.decode(response.body);
 
    if (response.statusCode == 200) {
   return  ExamRoutineModel.fromJson(jsonData);
    } 
      return  ExamRoutineModel.fromJson(jsonData);
  }

   Future<AcademicClassesModel> getAcademicCls() async {
  String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient.get(
        Uri.parse(
            "https://demo.webpointbd.com/api/classes"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ApiUrl.token,
        });
    var jsonData = json.decode(response.body);


    if (response.statusCode == 200) {
      
   return  AcademicClassesModel.fromJson(jsonData);
    } 
      return  AcademicClassesModel.fromJson(jsonData);
  }

 Future<ExaminationsModel> getSelectExam() async {
  String token = "302|kqsrC7vOkljIX68usiZiGV5zCDMkjkyovsjZuABv";
    var response = await ApiUrl.userClient.get(
        Uri.https("demo.webpointbd.com","/api/examinations"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ApiUrl.token,
        });
    var jsonData = json.decode(response.body);

  print(jsonData);
    if (response.statusCode == 200) {
      
   return  ExaminationsModel.fromJson(jsonData);
    } 
      return  ExaminationsModel.fromJson(jsonData);
  }
  @override
  Widget build(BuildContext context) {
      return SafeArea(child: Scaffold(
       appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("Exam Routine",
      
      ), centerTitle: true, ),

    body: ListView(
      children: [
            

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h,  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                       
                        height: 40.h,
                        alignment: Alignment.center,
                        width: 150.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: Colors.grey)),
                        child: FutureBuilder<AcademicClassesModel>(future: getAcademicCls(),
                        builder: ((context, snapshot) {
                          if(snapshot.hasData){
                            var data = snapshot.data!; 
                            return DropdownButton(
                              hint: Text("Select Class "),
                              underline: SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                             value: classValue,
                              items: data.classes!.map((e) =>DropdownMenuItem(
                              value:e.numericClass, 
                              child:Text("${e.name}",),
                              
                              )).toList(),
                            
                             onChanged:(value){
                              setState(() {
                                classValue = value.toString();
                                print(classValue);
                              });
                             });
                          }
                          return Center(child: CircularProgressIndicator(),);
                        }),
                        
                        )),
                     Container(
                       
                        height: 40.h,
                        alignment: Alignment.center,
                        width: 150.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: Colors.grey)),
                        child: FutureBuilder<ExaminationsModel>(future: getSelectExam(),
                        builder: ((context, snapshot) {
                          if(snapshot.hasData){
                            var data = snapshot.data!; 
                            return DropdownButton(
                              hint: Text("Select Exam "),
                              underline: SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                             value: eaxmValue,
                              items: data.exams!.map((e) =>DropdownMenuItem(
                              value:e.id.toString(), 
                              child:Text("${e.name}",),
                              
                              )).toList(),
                            
                             onChanged:(value){
                             
                                setState(() {
                                eaxmValue = value.toString();
                                if(classValue !=null && eaxmValue !=null){
                                print(eaxmValue);
                                selectClass=true;
                                fetchRoutine();}
                              });
                               
                             });
                          }
                          return Center(child: CircularProgressIndicator(),);
                        }),
                        
                        )),
                            
                ],
              ),
            ),
                      SizedBox(height: 15.h,), 
       selectClass==true ?Container(
        
          height: 600.h,
          child: Expanded(
            child: FutureBuilder(
              future: fetchRoutine(),
              builder: (context,AsyncSnapshot snapshot) {
               if(snapshot.hasData){
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
               return Center(child: CircularProgressIndicator(),);
              }
            ),
          ),
        ):Center(child:Padding(
          padding:  EdgeInsets.only(top: 60.h),
          child: Text("Please Select Class and Exam", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
        )),
      ],
    ),

    ));
  }
}