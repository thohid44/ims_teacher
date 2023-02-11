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
  
    
      title:  Text(widget.title),
      subtitle: Text(
        isSelected ? "Selected" : 'Not Selected',
      ),
     
      trailing: Switch(value: isSelected , onChanged:(bool value){
         setState(() {
      isSelected=!isSelected;

      
       print(_con.mobile);
        _con.mobile2Update();
        print("mobile 2 ${ _con.mobile2}");
                                    for (int i = 0;
                                        i <= _con.mobile.length;
                                        i++) {
                                      if (_con.mobile2[i]
                                              ['student_academic_id'] ==
                                          _con.mobile2[i]
                                              ['student_academic_id'] && _con.mobile2[i]
                                            ['attendance_status_id'] == 2  ) {
                                        _con.mobile2[i]
                                            ['attendance_status_id'] = 1;
                                      }else{
                                        _con.mobile2[i]
                                            ['attendance_status_id'] = 2;
                                      }

                                      //print(mobile);
                                      print(_con.mobile2);
                                    }
        print("object");
    
    });
      },)
    );
  }
}