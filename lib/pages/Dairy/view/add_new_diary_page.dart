import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Dairy/model/add_new_dairy_model.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';

class AddNewDiaryPage extends StatefulWidget {
  const AddNewDiaryPage({super.key});

  @override
  State<AddNewDiaryPage> createState() => _AddNewDiaryPageState();
}

class _AddNewDiaryPageState extends State<AddNewDiaryPage> {
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
  const  DropdownMenuItem(child: Text("Academic Class"),value: "Academic Class"),
  const  DropdownMenuItem(child: Text("Class Five"),value: "5"),
   const DropdownMenuItem(child: Text("Class Six"),value: "6"),
   const DropdownMenuItem(child: Text("Class Seven"),value: "7"),
   const DropdownMenuItem(child: Text("Class Eight"),value: "8"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItem{
  List<DropdownMenuItem<String>> menuItem = [
  const  DropdownMenuItem( child: Text("Select Subject "),value: "Select Subject"),
   const  DropdownMenuItem(child: Text("Bangla "),value: "1"),
   const  DropdownMenuItem(child: Text("English "),value: "2"),
 
  ];
  return menuItem;
}
 GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
final TextEditingController _des = TextEditingController(); 


String selectedValue = "Academic Class";

  String selectedValue1 = "Select Subject";
 var url = ApiUrl.baseUrl;
   addNewDairy() async{
     
       var response = await ApiUrl.userClient.post(
        Uri.parse('$url/teacher-add-diary'), 
        headers: {
'Accept':'application/json',
      'Authorization': 'Bearer '+ApiUrl.token,
        }, 
        body:  {
        "academic_class_id": selectedValue.toString(),
        "date": dateController.text,
        "teacher_id": "2",
        "subject_id": selectedValue1.toString(),
        "description": _des.text.toString()
    } 
      );
print(response); 
       var data = json.decode(response.body); 
         print(data);
    if(response.statusCode==200){
      print(data); 
    }
      
   }
    TextEditingController dateinput = TextEditingController(); 
    void initState(){
      dateinput.text = "";
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD NEW DIARY"), centerTitle: true, backgroundColor: primaryColor,),
     

      body: ListView(
        children: [
                   
  SizedBox(height: 20.h,),
            Container(
            width: 160.w,
            height: 45.h,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
             child: _buildDatePicker()
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

          print(selectedValue);

        });
      },
      items: dropdownItems
      ),
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
      value: selectedValue1,
      style: TextStyle(color: Colors.black,fontSize: 17.sp),
      onChanged: (String? newValue){
        setState(() {
          selectedValue1 = newValue!;
          print(selectedValue1);
        });
      },
      items: dropdownItem
      )
           ),
           SizedBox(height: 20.h,),
    Container(
     
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: FlutterSummernote(
        height: 400,
        key: _keyEditor,
        value: "Value",
    hint: "Enter your text...",
    
    hasAttachment: true,
    showBottomToolbar: true,
     
    customToolbar: """[
      ['style' : 'bold','italic', 'underline', 'clear']],
      ['font' : 'superscript', 'subscript', 'strikethrough']],
      ['insert; : 'link' ,'hr', 'table']] 
    ]""",
//returnContent: _keyEditor.currentContext!.getText(),
),
    ),
     
    // SizedBox(height: 15.h,),

       InkWell(
        onTap: () async{
  //   await addNewDairy(); 
  print(_keyEditor);
        },
         child: Container(
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
       ),
     SizedBox(height: 20.h,)
        ],
      ),
     
    );
  }


   final TextEditingController dateController = TextEditingController(); 
 
  DateTime selectedDate = DateTime.now(); 
  late String date; 
  late String weekDay; 
  Widget _buildDatePicker(){
    
    return TextFormField(
    controller: dateController,
    readOnly: true,
    textAlign: TextAlign.center,
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.all(8.0), 
      suffixIcon: Icon(Icons.date_range, color: dark,), 
      hintText: "YYYY-MM-DD", 
      hintMaxLines: 1, 
      hintStyle: TextStyle(fontSize: 15.0), 
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ), 
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ), 

      
    ),
    onTap:() async{
        final pickedDate = await selectDate(
        context:context, 
        initialDate:selectedDate,
        allowedDays:_allowedDays 
         );
      if(pickedDate != null && pickedDate !=selectedDate){
setState(() {
  selectedDate = pickedDate; 
  dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate); 
  print("thohdi ${dateController.text}");
});
      }
      }
    );
  }
    bool _allowedDays(DateTime day) {
    if ((day.isBefore(DateTime.now()))) {
      return true;
    }
    return false;
  }
  selectDate({
 required BuildContext context,
  required DateTime initialDate,
  required allowedDays
}) async {
  final selected = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2010),
    lastDate: DateTime(2025),
    selectableDayPredicate: allowedDays,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
           
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return selected;
}
}