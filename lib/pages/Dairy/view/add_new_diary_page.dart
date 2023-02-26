import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Attendance/controller/take_attend_controller.dart';

import 'package:intl/intl.dart';

class AddNewDiaryPage extends StatefulWidget {
  const AddNewDiaryPage({super.key});

  @override
  State<AddNewDiaryPage> createState() => _AddNewDiaryPageState();
}

class _AddNewDiaryPageState extends State<AddNewDiaryPage> {

String imagePath = ''; 

final  _picker = ImagePicker(); 

Future getImage() async{
 XFile? file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 10);
if(file != null){
  return file.path; 
} else {
  return ''; 
}
  
}
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  final TextEditingController _des = TextEditingController();
  String? classValue;
   bool selectedImage = false; 
  String selectedValue = "Select Class";
 String? subjectValue; 
  String selectSubject = "Select Subject";
  final _box = GetStorage();
  var url = ApiUrl.baseUrl;
  addNewDairy() async {
    var token = _box.read(LocalStoreKey.token);
    print(token);
    var response = await ApiUrl.userClient
        .post(Uri.parse('$url/teacher-add-diary'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token,
    }, body: {
      "academic_class_id": selectedValue.toString(),
      "date": dateController.text,
      "teacher_id": "2",
      "subject_id": selectSubject.toString(),
      "description": _des.text.toString()
    });
    print(response);
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
     Get.snackbar("Data", "Successfully Added"); 
    }
  }

  TextEditingController dateinput = TextEditingController();
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _con = Get.put(TakeAttendController());
    _con.getAcademicCls(); 
    _con.fetchSubject(); 
   print("class ${ _con.classList}");
 
   print("class ${ _con.subjectList}");
    return Scaffold(
    
      appBar: AppBar(
        title: Text("ADD NEW DIARY"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
              width: 160.w,
              height: 45.h,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: _buildDatePicker()),
          SizedBox(
            height: 10.h,
          ),

          Container(
              height: 40.h,
              alignment: Alignment.center,
                   margin: EdgeInsets.symmetric(horizontal: 30.w),
              width: 230.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Colors.grey)),
              child: GetBuilder<TakeAttendController>(builder: (context) {
                return DropdownButton(
                    hint: Text("Select Class"),
                    underline: SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: classValue,
                    items: _con.classList
                        .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(
                                "${e.name} ${e.id}",
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                        print("Dairy Class $selectedValue"); 
                      });
                    });
              })),

          SizedBox(
            height: 10.h,
          ),
           Container(
              height: 40.h,
              alignment: Alignment.center,
                   margin: EdgeInsets.symmetric(horizontal: 30.w),
              width: 230.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Colors.grey)),
              child: GetBuilder<TakeAttendController>(builder: (context) {
                return DropdownButton(
                    hint: Text("Select Subject"),
                    underline: SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: subjectValue,
                    items: _con.subjectList
                        .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(
                                "${e.name }",
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectSubject = value.toString();
                        print("Dairy Class $selectSubject"); 
                      });
                    });
              })),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _des, 
              decoration: InputDecoration(),
            )
          ),

          SizedBox(height: 10.h,),
         
           Container(
            child: imagePath==''?Image.asset('assets/camera.png', height: 70, width: 70,):Image.file(File(imagePath))
           ), 
            SizedBox(height: 10.h,), 
          InkWell(
            onTap: ()  {
           selectImage();
              setState(() {
                
              });
                  // addNewDairy();
              print(_keyEditor);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              alignment: Alignment.center,
              height: 50.h,
              width: 150.w,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Text(
                "Submit Diary",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  final TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  late String date;
  late String weekDay;
  Widget _buildDatePicker() {
    return TextFormField(
        controller: dateController,
        readOnly: true,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          suffixIcon: Icon(
            Icons.date_range,
            color: dark,
          ),
          hintText: "YYYY-MM-DD",
          hintMaxLines: 1,
          hintStyle: TextStyle(fontSize: 15.0),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        onTap: () async {
          final pickedDate = await selectDate(
              context: context,
              initialDate: selectedDate,
              allowedDays: _allowedDays);
          if (pickedDate != null && pickedDate != selectedDate) {
            setState(() {
              selectedDate = pickedDate;
              dateController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              print("thohdi ${dateController.text}");
            });
          }
        });
  }

  bool _allowedDays(DateTime day) {
    if ((day.isBefore(DateTime.now()))) {
      return true;
    }
    return false;
  }

  selectDate(
      {required BuildContext context,
      required DateTime initialDate,
      required allowedDays}) async {
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
              style: TextButton.styleFrom(),
            ),
          ),
          child: child!,
        );
      },
    );
    return selected;
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            imagePath = await getImage();
                            print('Image_Path:-');
                            print(imagePath);
                            if (imagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            imagePath = await getImage();
                            print('Image_Path:-');
                            print(imagePath);

                            if (imagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
