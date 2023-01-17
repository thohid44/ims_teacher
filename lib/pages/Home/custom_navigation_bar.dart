import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';

class CustomNavigationBar extends StatefulWidget {

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
int _page=0;

  @override
  Widget build(BuildContext context) {
    var _bottomNavigationKey;
    return Container(
        child: CurvedNavigationBar(
          backgroundColor: Colors.white,
         
          key: _bottomNavigationKey,
        
          index: 0,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.folder, size: 30, color: Colors.white,),
            Icon(Icons.share, size: 30,color: Colors.white,),
            Icon(Icons.home, size: 30,color: Colors.white,),
           
            Icon(Icons.copy, size: 30,color: Colors.white,),
          ],
          color: primaryColor,
          buttonBackgroundColor: primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      );
  }
}