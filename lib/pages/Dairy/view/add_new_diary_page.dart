import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';

class AddNewDiaryPage extends StatefulWidget {
  const AddNewDiaryPage({super.key});

  @override
  State<AddNewDiaryPage> createState() => _AddNewDiaryPageState();
}

class _AddNewDiaryPageState extends State<AddNewDiaryPage> {
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
  const  DropdownMenuItem(child: Text("Academic Class"),value: "Academic Class"),
  const  DropdownMenuItem(child: Text("Class Five"),value: "five"),
   const DropdownMenuItem(child: Text("Class Six"),value: "six"),
   const DropdownMenuItem(child: Text("Class Seven"),value: "seven"),
   const DropdownMenuItem(child: Text("Class Eight"),value: "eight"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItem{
  List<DropdownMenuItem<String>> menuItems = [
  const  DropdownMenuItem(child: Text("Subject "),value: "Subject 1"),
 
  ];
  return menuItems;
}


String selectedValue = "Academic Class";

  String selectedValue1 = "Subject";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD NEW DIARY"), centerTitle: true, backgroundColor: primaryColor,),
     

      body: ListView(
        children: [
          SizedBox(height: 20.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            width: 160.w,
            height: 45.h,
             child: TextField(
                        decoration: InputDecoration(
                         labelText: "YYYY-MM-DD", 
                         labelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.w, color: Colors.grey)),
                         enabledBorder: OutlineInputBorder(
                          
                          borderSide: BorderSide(
                            width: 1.w, 
                            color: Colors.grey
                          )
                         ), 

                         suffixIcon: Icon(Icons.calendar_month, size: 20.h,)
                        ),),
           ),
  SizedBox(height: 20.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 30.w),
            height: 45.h,
            alignment: Alignment.center,
            width: 150.w,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: Colors.grey)
            ),
             child: DropdownButton(
              underline: SizedBox(),
      value: selectedValue,
      style: TextStyle(color: Colors.black,fontSize: 17.sp),
      onChanged: (String? newValue){
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: dropdownItems
      )
           ),

           SizedBox(height: 20.h,),
           
    Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        maxLines: 12,
        decoration: InputDecoration(
         
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.w, color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
            
           borderSide: BorderSide(
                            width: 1.w, 
                            color: Colors.grey
                          )
          )
        ),
      ),
    ),
     
    // SizedBox(height: 15.h,),

       Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 15.h),
        alignment: Alignment.center,
        height: 50.h,
        width: 150.w, 
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
           borderRadius: BorderRadius.circular(30.r)

        ),

        child: Text("Submit Diary",style: TextStyle(fontFamily: 'Roboto',color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.bold),),
       ),
     SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}