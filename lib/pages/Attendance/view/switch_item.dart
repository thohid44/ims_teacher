import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';

class MyListItem extends StatefulWidget {
  final String title;
  final String roll; 
  const MyListItem({ Key? key, required this.title, required this.roll }) : super(key: key);

  @override
  State<MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
    bool isSelected = true;

void toggleSwitch(bool value){
   
}

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(TakeAttendController()); 
    return ListTile(
  
    
      title:  Text("Title"+widget.title),
      subtitle: Text(
        isSelected ? "Selected" : 'Not Selected',
      ),
     
      trailing: Switch(value: isSelected , onChanged:(bool value){
         setState(() {
      isSelected=!isSelected;
      if(isSelected){
        _con.mobile2; 
        print("object");
      }else{
        print("No");
      }
    });
      },)
    );
  }
}