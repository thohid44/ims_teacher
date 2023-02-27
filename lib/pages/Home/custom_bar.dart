import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:native_screenshot/native_screenshot.dart';

class CustomNavigationBar extends StatefulWidget {


  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late Widget _imgHolder;
int _page=0;
void initState() {
		super.initState();

		_imgHolder = Center(
			child: Icon(Icons.image),
		);
	} 
  @override
  Widget build(BuildContext context) {
    var _bottomNavigationKey;
    return Container(
      height: 40.h,
        child: CurvedNavigationBar(
          backgroundColor: Colors.white,
         
          key: _bottomNavigationKey,
        
          index: 0,
          height: 60.0,
          items:  <Widget>[
            Icon(Icons.folder, size: 30, color: Colors.white,),
            Icon(Icons.share, size: 30,color: Colors.white,),
            Icon(Icons.home, size: 30,color: Colors.white,),
           
          
            IconButton(onPressed:() async{
print("object"); 
String? path = await NativeScreenshot.takeScreenshot();

								debugPrint('Screenshot taken, path: $path');

								if( path == null || path.isEmpty ) {
									ScaffoldMessenger.of(context).showSnackBar(
										SnackBar(
											content: Text('Error taking the screenshot :('),
											backgroundColor: Colors.red,
										)
									); // showSnackBar()

									return;
								} // if error

								ScaffoldMessenger.of(context).showSnackBar(
									SnackBar(
										content: Text('The screenshot has been saved to: $path')
									)
								); // showSnackBar()

								File imgFile = File(path);
								_imgHolder = Image.file(imgFile);

								setState(() {});
            }, icon:Icon(Icons.copy, size: 30,color: Colors.white,))
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