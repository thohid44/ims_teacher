import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';

class LocalDataStoreTest extends StatefulWidget {
  const LocalDataStoreTest({super.key});

  @override
  State<LocalDataStoreTest> createState() => _LocalDataStoreTestState();
}

class _LocalDataStoreTestState extends State<LocalDataStoreTest> {
  
late SharedPreferences prefs; 

  final TextEditingController _stdId = TextEditingController(); 
  final TextEditingController title = TextEditingController(); 


  List stdList = [];
  List todos = [];
  List<Todo> localdata = []; 

  setupTodo() async{
    prefs =await SharedPreferences.getInstance();
    String? stringTodo = prefs.getString('todo');
    List todoList = jsonDecode(stringTodo!); 
    for(var todo in todoList){
      setState(() {
        stdList.add(Todo.fromJson(todo)); 
      });
      print(stdList); 
    }}

   void saveTodo(){
 List items = todos.map((e) => e.toJson()).toList();
 prefs.setString('todo', jsonEncode(items));
    }
late SharedPreferences pref; 
 saveList() async{
  pref = await SharedPreferences.getInstance();
  pref.setStringList('list', [_stdId.text,title.text]);

 }   
    @override
    void initState(){
      super.initState();
      setupTodo();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Local Store Data Test")), 
      body: ListView(
        children: [
          SizedBox(height: 30,), 
          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
            controller: _stdId,
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),), 
             Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
            controller: title,
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),)
          , 
          ElevatedButton(onPressed: ()async{
            print(_stdId.text); 
         saveTodo();
      print(stdList); 
     
          }, child: Text("Save Data")), 

          SizedBox(height: 20,), 
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder:(context,index){
              return Container(
                child: Text(stdList[index], style:TextStyle(color: Colors.black),),
              ); 
            }),
          )
        ],

        
      )

    );
  }
}

class Storekey {

  static const studentId = "STUDENTID"; 

}







class Todo {
    Todo({
        this.id,
        this.title,
    });

    int? id;
    String? title;

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}
