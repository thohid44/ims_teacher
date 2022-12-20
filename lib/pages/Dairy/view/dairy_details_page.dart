import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class DairyDetailsPage extends StatefulWidget {
  const DairyDetailsPage({super.key});

  @override
  State<DairyDetailsPage> createState() => _DairyDetailsPageState();
}

class _DairyDetailsPageState extends State<DairyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
 AppBar(
        backgroundColor: primaryColor,
        title: Text("Diary: Bangla 1st Paper", 
      
      ), centerTitle: true, ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            customText("Date:12-12-2022", dark, 16.0, FontWeight.bold),
              customText("Teacher Name", dark, 16.0, FontWeight.bold)
          ],),
          SizedBox(height: 15.h,), 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
            child: customText("Lorem Ipsum is simply dummy text of the printing and typesetting i ndustry. Lorem Ipsum has been the industry's standard dummy te xt ever since the 1500s, when an unknown printer took a galley of t ype and scrambled it to make a type specimen book. It has", dark, 15.sp, FontWeight.normal)),

        
           SizedBox(height: 20.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child:Image.asset("assets/diary-img.jpg") ,
          ), 
          SizedBox(height: 10.h,)
        ],
      ),
    );
    
  }
}