import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Academic/model/academicClassesModel.dart';
import 'package:imsteacher/pages/Exam/model/exam_routine_model.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class ExamRoutinePage extends StatefulWidget {
  const ExamRoutinePage({super.key});

  @override
  State<ExamRoutinePage> createState() => _ExamRoutinePageState();
}

class _ExamRoutinePageState extends State<ExamRoutinePage> {

  
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Select Class"), value: "Select Class"),
      const DropdownMenuItem(child: Text("Class One"), value: "1"),
      const DropdownMenuItem(child: Text("Class Two"), value: "2"),
      const DropdownMenuItem(child: Text("Class Three"), value: "3"),
      const DropdownMenuItem(child: Text("Class Four"), value: "4"),
    ];
    return menuItems;
  }

   

     String selectClsValue= "Select Class";
  bool selectClass = false;

// get class 
String? classValue;

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
              margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h,  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                       
                        height: 40.h,
                        alignment: Alignment.center,
                        width: 140.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: Colors.grey)),
                        child: FutureBuilder<AcademicClassesModel>(future: getAcademicCls(),
                        builder: ((context, snapshot) {
                          if(snapshot.hasData){
                            var data = snapshot.data!; 
                            return DropdownButton(
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
                        width: 140.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: Colors.grey)),
                        child: DropdownButton(
                            underline: SizedBox(),
                            value: selectClsValue,
                            style: TextStyle(color: Colors.black, fontSize: 17.sp),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectClsValue = newValue!;
                                if (selectClass == "Select Class") {
                                  selectClass = false;
                                } else {
                                  selectClass = true;
                                }
                              });
                            },
                            items: dropdownItems)),
                ],
              ),
            ),
                      SizedBox(height: 15.h,), 
        Container(
        
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
        ),
      ],
    ),

    ));
  }
}