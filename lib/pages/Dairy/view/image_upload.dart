import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade800,
      body: Center(
        child: Column(
         children: [

          Container(
            height: 100.h, 
            child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
              return SizedBox(
                child: Card(
                  child:Row(children: [
                    Container(
                      height: 90.h,
                      width: 80.w,
                      child: Image.asset("assets/mobile.png"),
                    ), 
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Check Shipping Content", style:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        ), 
                          Container(
                          child: Text("Always check & carry", style:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        ),
                          Container(
                          child: Text("Open items and legal items", style:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        ),  
                          Container(
                          child: Text( "Avoid  risks & stay safe.", style:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        ), 
                      ],
                    )
                  ]) ,
                ),
              ); 
            })
            
          ), 

          SizedBox(height:20.h
          ), 

          Stack(
            children: [
              Container(
                height: 200.h,
                width: 270.w,
                child:Column(
                 children: [
                   Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange, 

                      ),
                      height: 50.h, 
                      width: 130.w,
                      child: Text("Want to give a ride & \n make money?", style: TextStyle(
                        fontSize: 13.sp, 
                      ),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange, 

                      ),
                      height: 50.h, 
                      width: 130.w,
                      child: Row(
                        children: [
                         Image.asset("assets/mobile.png", 
                         height: 50.h, width: 20.w,fit: BoxFit.fitHeight,
                         ),
                         Column(
                          children: [
                        
                            Text("TripShipTask", style: TextStyle(
                        fontSize: 11.sp, 
                      ),),
                      
                            Text("Move shipping Task", style: TextStyle(
                        fontSize: 11.sp, 
                      ),),
                          ],
                         )
                        ],
                      ),
                    ),
                  ],),
 SizedBox(height: 10.h,), 
                   Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange, 

                      ),
                      height: 50.h, 
                      width: 130.w,
                      child: Text("Post your destination & choose passengers who are headed the same direction", style: TextStyle(
                        fontSize: 13.sp, 
                      ),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange, 

                      ),
                      height: 60.h, 
                      width: 50.w,
                      child: Image.asset("assets/mobile.png", 
                         height: 50.h, width: 50.w,
                         ),
                    ),
                  ],)
                 ],
                )
              ),
            ],
          )

         ],
          
        ),
      ),
    );
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
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
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
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
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