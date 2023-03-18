import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _page = 0;
  int _index = 0;
  late Widget _imgHolder;
  late final path;
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
    
      child: CurvedNavigationBar(
        backgroundColor: Colors.white,
        key: _bottomNavigationKey,
        index: _index,
        height: 45.0.h,
        items: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
              icon: Icon(
                Icons.folder,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                print(path);
                Share.shareFiles([path]);

                setState(() {
                  _index = 1;
                });
              },
              icon: Icon(
                Icons.share,
                size: 30.h,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  _index = 2;
                });
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () async {
                path = await NativeScreenshot.takeScreenshot();

                if (path == null || path!.isEmpty) {
                  Get.snackbar('Error', 'Please Take a Screenshot',
                      snackPosition: SnackPosition.BOTTOM);

                  return;
                } // if error

                Get.snackbar('Screen shot', 'Successfully Saved',
                backgroundColor: Colors.purple,
                colorText: Colors.white,
                    snackPosition: SnackPosition.TOP);

                File imgFile = File(path);
                _imgHolder = Image.file(imgFile);

                setState(() {
                  _index = 3;
                });
              },
              icon: Icon(
                Icons.copy,
                size: 30,
                color: Colors.white,
              ))
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
