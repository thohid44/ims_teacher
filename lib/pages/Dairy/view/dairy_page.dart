import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_details_page.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class DairyPage extends StatefulWidget {
  const DairyPage({super.key});

  @override
  State<DairyPage> createState() => _DairyPageState();
}

class _DairyPageState extends State<DairyPage> {

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
  const  DropdownMenuItem(child: Text("Class Five"),value: "Academic Class"),
  const  DropdownMenuItem(child: Text("Class Five"),value: "five"),
   const DropdownMenuItem(child: Text("Class Six"),value: "six"),
   const DropdownMenuItem(child: Text("Class Seven"),value: "seven"),
   const DropdownMenuItem(child: Text("Class Eight"),value: "eight"),
  ];
  return menuItems;
}
String selectedValue = "Academic Class";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("DIARY", Colors.white),

      body:  ListView(
          children: [
            SizedBox(height: 10.h,), 
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
            width: 160.w,
            height: 45.h,
             child: TextField(
                
                        decoration: InputDecoration(
                         labelText: "YYYY-MM-DD", 
                         labelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                         enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.w, 
                            color: Colors.grey
                          )
                         ), 

                         suffixIcon: Icon(Icons.calendar_month, size: 20.h,)
                        ),),
           ),
           Container(
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
            ],
           ) ,
      
          SizedBox(height: 30.h,), 
      Center(child: customText("Ten A Science", dark, 17.0, FontWeight.bold)),
      SizedBox(height: 10.h,), 
        Center(child: customText("2022-12-12", dark, 17.0, FontWeight.bold)),
       SizedBox(height: 30.h,), 
         Container(
          height: 400.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
           child: Expanded(
                child: ListView.builder(
                   itemCount: 4,
                   itemBuilder: ((context, index) {
                     return   Card(
                      child: Container(
                      
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                      
                          title: customText("Bangla 1st Page", dark, 17.0, FontWeight.bold),
                          subtitle: customText("Bangla 1st Page Bangla 1st Page Bangla 1st Page Bangla 1st PageBangla 1st Page",
                           dark, 13.0, FontWeight.normal),

                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>DairyDetailsPage()));
                           },
                        ),
                      ),
                    );
                   }),
                ),
              ),
         ),
          
      
          ],
        ),
      
    );
  }
}