import 'package:flutter/material.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';

AppBar customAppBar(String? title, Color? colors, ){
  return AppBar(
    
    automaticallyImplyLeading: false,
    centerTitle: true,
    elevation: 0,
    leading: Icon(Icons.arrow_back, color: Colors.black,),
    title: Text(title.toString(), style: TextStyle(
      fontFamily: 'Roboto', 
      color: Colors.white
    ),),
    backgroundColor: primaryColor
  ); 
}
