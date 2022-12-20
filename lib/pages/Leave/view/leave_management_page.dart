import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';
import 'package:intl/intl.dart';
class LeaveManagementPage extends StatefulWidget {
  const LeaveManagementPage({super.key});

  @override
  State<LeaveManagementPage> createState() => _LeaveManagementPageState();
}

class _LeaveManagementPageState extends State<LeaveManagementPage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("LEAVE MANAGEMENT", Colors.white),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30), 
            child: _buildDatePicker(),
          ), 

          SizedBox(height: 30,), 
          Container(
            padding: EdgeInsets.only(left: 20),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              customText("Id : 1233", dark, 17.0, FontWeight.bold),
               customText("Name : Ali Akbar", dark, 17.0, FontWeight.bold),
                customText("Class : Ten A Science", dark, 17.0, FontWeight.bold),
                 customText("Rank : 34", dark, 17.0, FontWeight.bold)
            ],),
          ), 
            Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30), 
            child: _buildDatePicker(),
          ), 

            Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20), 
            child: _buildDatePicker(),
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