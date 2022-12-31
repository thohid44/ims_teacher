import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class ResultSheet extends StatefulWidget {
  const ResultSheet({super.key});

  @override
  State<ResultSheet> createState() => _ResultSheetState();
}

class _ResultSheetState extends State<ResultSheet> {

  
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
  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> menuItem = [
      const DropdownMenuItem(
          child: Text("Student ID"), value: "Student ID"),
      const DropdownMenuItem(child: Text("s10575"), value: "1"),
      const DropdownMenuItem(child: Text("s10577"), value: "2"),
      const DropdownMenuItem(child: Text("s10577"), value: "3"),
      const DropdownMenuItem(child: Text("s10576"), value: "4"),
    ];
    return menuItem;
  }
    String selectedValue = "Select Class";
    String selectedStdId = "Student ID";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result Sheet"), 
        backgroundColor: primaryColor,
      ),

      body: ListView(
        children: [
          SizedBox(height: 20.h,), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Container(
                  // margin:
                  //     EdgeInsets.only(left: 30.w),
                  height: 45.h,
                  alignment: Alignment.center,
                  width: 150.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey)),
                  child: DropdownButton(
                      underline: SizedBox(),
                      value: selectedStdId,
                      style: TextStyle(color: Colors.black, fontSize: 17.sp),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStdId = newValue!;
                          
                        });
                      },
                      items: dropdownItem)),
                        Container(
              //  margin:
              //         EdgeInsets.only(right: 30.w),
                  height: 45.h,
                  alignment: Alignment.center,
                  width: 150.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey)),
                  child: DropdownButton(
                      underline: SizedBox(),
                      value: selectedValue,
                      style: TextStyle(color: Colors.black, fontSize: 17.sp),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          
                        });
                      },
                      items: dropdownItems)),
            ],
          ), 
          Container(

            margin: EdgeInsets.all(20.h),
            padding: EdgeInsets.only(left: 20.w, top: 10.h,
            right: 20.w),
            width: double.infinity, 
            
            height: 180.h,
            decoration: BoxDecoration(
              color: Color(0xfff0afaf), 
             borderRadius: BorderRadius.circular(10.r)
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: customText("1st Term", dark, 17.0, FontWeight.bold),
                ), 
                SizedBox(height: 10.h,), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.w),
                     width: 120.w,
                     height: 25.h,
                     decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("GPA",style: TextStyle(fontWeight: FontWeight.bold),),
                    ), 
                      Container(

                     width: 50.w,
                         alignment: Alignment.center,
                    
                     height: 25.h,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("4",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                     alignment: Alignment.center,
                     height: 25.h,
                     width: 50.w,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("5",style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(height: 10.h,), 
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.w),
                     width: 120.w,
                     height: 25.h,
                     decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("GPA",style: TextStyle(fontWeight: FontWeight.bold),),
                    ), 
                      Container(

                     width: 50.w,
                         alignment: Alignment.center,
                    
                     height: 25.h,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("875",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                     alignment: Alignment.center,
                     height: 25.h,
                     width: 50.w,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("1000",style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                    SizedBox(height: 10.h,), 
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.w),
                     width: 120.w,
                     height: 25.h,
                     decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("Attendance",style: TextStyle(fontWeight: FontWeight.bold),),
                    ), 
                      Container(

                     width: 50.w,
                         alignment: Alignment.center,
                    
                     height: 25.h,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("67",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                     alignment: Alignment.center,
                     height: 25.h,
                     width: 50.w,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.w)
                     ),
                      child: Text("82",style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                 SizedBox(height: 10.h,), 
          Container(
                     alignment: Alignment.center,
                     height: 25.h,
                     width: 80.w,
                      decoration: BoxDecoration(
                    
                     ),
                      child: Text("PASSED",style: TextStyle(fontWeight: FontWeight.bold),),
                    )
              ],
            ),
          ), 

         
        ],
      ),
    );
  }
}