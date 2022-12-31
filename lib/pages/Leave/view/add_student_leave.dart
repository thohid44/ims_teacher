import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';

class AddStudentLeave extends StatefulWidget {
  const AddStudentLeave({super.key});

  @override
  State<AddStudentLeave> createState() => _AddStudentLeaveState();
}

class _AddStudentLeaveState extends State<AddStudentLeave> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text("Student Leave", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          backgroundColor: primaryColor,
        ),
        
        body: ListView(
          children: [
            
            Container(
              height: 45.h,
              margin: EdgeInsets.only(left: 30.w,top: 30.h, right: 30.w),
              child: TextFormField(

                decoration:const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                height: 45.h,
                    width: 150,
              
                child: TextFormField(

                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()
                  ),
                ),
              ),
          
              Container(
                height: 45.h,
                width: 150,
               
                child: TextFormField(

                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()
                  ),
                ),
              ),
                ],
              ),
            ), 
   SizedBox(height: 20.h,),
             Container(
            
              margin: EdgeInsets.only(left: 30.w,top: 30.h, right: 30.w),
              child: TextFormField(
               maxLines: 6,
               minLines: 6,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(), 
                  focusedBorder: OutlineInputBorder()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}