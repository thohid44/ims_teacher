import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
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
import 'package:imsteacher/pages/Dairy/Controller/Dairies_Controllder.dart';
import 'package:http/http.dart' as http;
import 'package:imsteacher/pages/Home/deshboard.dart';
import 'package:intl/intl.dart';

class AddNewDiaryPage extends StatefulWidget {
  const AddNewDiaryPage({super.key});

  @override
  State<AddNewDiaryPage> createState() => _AddNewDiaryPageState();
}

class _AddNewDiaryPageState extends State<AddNewDiaryPage> {
  bool isSelect = false;
  bool isSubject = false;
 
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  

//final  TextEditingController dateinput = TextEditingController();
  final TextEditingController description= TextEditingController();

  String? classValue;
  bool selectedImage = false;
  String? selectClass;
  String? selectSub = "Select Subject";
  String selectedValue = "Select Class";
  String? subjectValue;
  var subId;
  final _box = GetStorage();
  var url = ApiUrl.baseUrl;
   late File uploadimage; //variable for choosed file
   String? imgPath = ''; 
 
  void initState() {
    //dateinput.text = "";
    
    super.initState();
  }
  final    AllDairyController _diaryController = Get.put(AllDairyController()); 

  @override
  Widget build(BuildContext context) {
    var _con = Get.put(TakeAttendController());
    _con.getAcademicCls();
   _con.fetchSubject();

    return Scaffold(
      appBar: AppBar(
        title: Text("ADD NEW DIARY"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
                width: 285.w,
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: _buildDatePicker()),
            SizedBox(
              height: 10.h,
            ),
      
            Container(
                height: 40.h,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                width: 285.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey)),
                child: GetBuilder<TakeAttendController>(builder: (context) {
                  return DropdownButton(
                      hint: Text("${isSelect ? selectClass : 'Select Academic Class'}"),
                      underline: SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: classValue,
                      items: _con.classList
                          .map((e) => DropdownMenuItem(
                                onTap: () {
                                  selectClass = e.name.toString();
                                },
                                value: e.id,
                                child: Text(
                                  "${e.name} ",
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          isSelect = true;
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
                width: 285.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey)),
                child: GetBuilder<TakeAttendController>(builder: (context) {
                  return DropdownButton(
                      hint: Text("${isSubject ? selectSub : 'Select Subject'}", 
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, ),
                      ),
                      underline: SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: subjectValue,
                      items: _con.subjectList
                          .map((e) => DropdownMenuItem(
                                onTap: () {
                                  selectSub = e.name.toString();
                                },
                                value: e.id,
                                child: Text(
                                  "${e.name}", style: 
                                  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          isSubject = true; 
                          subId = value.toString();
                          print("Dairy Class $subId");
                        });
                      });
                })),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
                ),
                maxLines: 10,
                             minLines: 10,
              )
            ),
      
            SizedBox(
              height: 10.h,
            ),
      
            // imgPath == ''
            //     ? Image.asset(
            //         'assets/camera.png',
            //         height: 50,
            //         width: 50,
            //       )
            //     : Image.file(
            //         File(imgPath!),
            //         height: 200,
            //         width: 200,
            //         fit: BoxFit.fill,
            //       ),
      
            // SizedBox(
            //   height: 30.h,
            // ),
            // InkWell(
            //   onTap: () {
            //     selectImage();
            //     setState(() {});
            //   },
            //   child: Container(
            //       margin: EdgeInsets.symmetric(horizontal: 120.w),
            //       height: 40.h,
            //       width: 100.w,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(color: Colors.purple),
            //       child: Text(
            //         "Upload",
            //         style: TextStyle(
            //             fontSize: 15.sp,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       )),
            // ),
      
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
              addDairy();
             
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
      ),
    );
  }

  final TextEditingController dateController = TextEditingController();
  var dio = Dio();

   addDairy() async {

    var token = _box.read(LocalStoreKey.token);
    var teacher_id = _box.read(LocalStoreKey.teacherId);
    print("teacher Id $teacher_id"); 
  //    Map mapData =  
  //  var jsonData = jsonEncode(mapData); 
    try {
    var response = await dio.post(
      '$url/teacher-add-diary',
      data:{
      "academic_class_id":selectedValue,
      "date":"$date",
      "teacher_id":"$teacher_id",
      "subject_id":"$subId",
      "description":description.text.toString()
    }, options: Options(headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token,
    })
    );
   
  if (response.statusCode == 200) {
      
        Get.snackbar(
          "Diary",
          "Successfully Save",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.purple,
        );
        Get.to(DeashBoard());
      } else {}
    print('User created: ${response.data}');

   
  } catch (e) {
    print('Error creating user: $e');
  }

 

    }

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
            date=dateController.text; 
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
                            imgPath = await selectImageFromGallery();
                            _diaryController.imageFileUpload(imgPath!);
                            print('Image_Path:-');
                            print(imgPath);
                            if (imgPath != '') {
                              Navigator.pop(context);

                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
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
                                      'assets/gallery.png',
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
                            imgPath = await selectImageFromCamera();
                            print('Image_Path:-');
                            
                            print(imgPath);

                            if (imgPath != '') {
                              Navigator.pop(context);

                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
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
                                      'assets/camera.png',
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

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
