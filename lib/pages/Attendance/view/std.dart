import 'package:flutter/material.dart';

class TestAttendance extends StatefulWidget {
  const TestAttendance({super.key});

  @override
  State<TestAttendance> createState() => _TestAttendanceState();
}

class _TestAttendanceState extends State<TestAttendance> {
  List<Student> student = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Test Attendance Page"),),

    body: ListView.builder(
       itemCount: 10,
      itemBuilder:((context, index) {
      return ListTile(
        title: Text("Student Name"),
        subtitle: Text("$index"),
        onTap: (){
       Student std = (Student(index, "${"name"+index.toString()}", true));
       if(student.contains(std.id)){
     print("remove");
       }else{
        print('add'); 
       }
          addStudent(std);

          print(student); 
        },
      );
    })),
    );
  }

  addStudent(Student std) async{
   return student.add(Student(std.id, std.name, std.status)); 
  }
}


class Student{
  int? id;
  String? name; 
  bool? status; 
  
  Student(this.id, this.name, this.status);
}