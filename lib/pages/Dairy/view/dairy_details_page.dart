import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Dairy/model/single_dairy_model.dart';

import 'package:imsteacher/widgets/custom_text_widget.dart';

class DairyDetailsPage extends StatefulWidget {
  String? id;
   DairyDetailsPage({super.key, this.id});

  @override
  State<DairyDetailsPage> createState() => _DairyDetailsPageState();
}
//https://demo.webpointbd.com/api/teacher-add-diary

class _DairyDetailsPageState extends State<DairyDetailsPage> {

 var url = ApiUrl.baseUrl;
 final _box = GetStorage();
  Future<SingleDairyModel> fetchSingeDairy() async{
   var token =  _box.read(LocalStoreKey.token);
  print(token);  
    var response = await ApiUrl.userClient.get(Uri.parse("$url/teacher-diary?id=${widget.id}"), 
  
    headers: {    
      'Accept':'application/json',
      'Authorization': 'Bearer '+token,
    }
    
    );
      print(response.body); 
    var data = json.decode(response.body);

    if(response.statusCode==200){
      print(data); 
    }
    return SingleDairyModel.fromJson(data);

  }
  void initState(){
    fetchSingeDairy();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
 AppBar(
        backgroundColor: primaryColor,
        title: Text("Diary: Bangla 1st Paper", 
      
      ), centerTitle: true, ),
      body: FutureBuilder(
         future: fetchSingeDairy(),
         builder: (context, snapshot) {
          if(snapshot.hasData){
        return    ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              customText("Date:${snapshot.data!.diary!.date.toString()}", dark, 16.0, FontWeight.bold),
                customText("Teacher Name:${snapshot.data!.diary!.teacher.toString()}", dark, 16.0, FontWeight.bold)
            ],),
            SizedBox(height: 15.h,), 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
              child: customText("${snapshot.data!.diary!.description.toString()}", dark, 15.sp, FontWeight.normal)),
      
          
             SizedBox(height: 20.h,),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 15.w),
            //   child:Image.asset("assets/diary-img.jpg") ,
            // ), 
            SizedBox(height: 10.h,)
          ],
        );
          }
           return Center(child: CircularProgressIndicator(),);
         },
      ),
    );
    
  }
}