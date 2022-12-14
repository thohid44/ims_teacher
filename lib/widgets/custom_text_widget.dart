import 'package:flutter/cupertino.dart';

Widget customText(String title,color, size,FontWeight weight){
  return Text(title,style: TextStyle(
    color: color, 
    fontSize: size, 
    fontWeight: weight, 

  ), );
}