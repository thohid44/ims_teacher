import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/pages/Dairy/Controller/Dairies_Controllder.dart';
import 'package:imsteacher/pages/Dairy/model/all_dairy_model.dart';
import 'package:imsteacher/pages/Dairy/view/add_new_diary_page.dart';
import 'package:imsteacher/pages/Dairy/view/dairy_details_page.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:intl/intl.dart';

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
  
  AllDairyModel? _allDairyModel; 
   Future<AllDairyModel?>  fetchAllDairy() async{
  String url = 'https://demo.webpointbd.com/api/teacher-diaries?date=2022-12-09&academic_class_id=1'; 
final token ='299|zMyupKV6HpnziSTcgbRcH47kmdXki8zygRtgcg2L';
      var response = await ApiUrl.userClient.get(Uri.parse(url),
headers: {    
      'Accept':'application/json',
      'Authorization': 'Bearer '+token,
    } );
    
     var   data = json.decode(response.body);

    if(response.statusCode==200){
      return AllDairyModel.fromJson(data);
    }else{
      return AllDairyModel.fromJson(data);
    }
     
    }
  void initState(){
   fetchAllDairy(); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("DAILY DAIRY",
      
      ), centerTitle: true, ),

      body:  ListView(
          children: [
            SizedBox(height: 10.h,), 
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
            width: 160.w,
            height: 45.h,
             child: _buildDatePicker()
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
                child: FutureBuilder(
                  future: fetchAllDairy(),
               
                  builder:((context, snapshot) {
                 if(snapshot.hasData){
                   return ListView.builder(
                   itemCount: snapshot.data!.diaries!.length,
                   itemBuilder: ((context, index) {
                     return   Card(
                      child: Container(
                      
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                      
                          title: customText(snapshot.data!.diaries![index].subject.toString(), dark, 17.0, FontWeight.bold),
                          subtitle: customText(snapshot.data!.diaries![index].diary.toString(),
                           dark, 13.0, FontWeight.normal),

                           onTap: () {
                            String id = snapshot.data!.diaries![index].id.toString(); 
                           
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>DairyDetailsPage(
                              id:id
                             )));
                           },
                        ),
                      ),
                    );
                   }),
                );
                 }

                 return const Center(child: CircularProgressIndicator(),);
                }))
              ),
         ),
          
      
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