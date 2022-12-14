import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imsteacher/Utils/Constrans/color.dart';
import 'package:imsteacher/widgets/custom_appbar.dart';
import 'package:imsteacher/widgets/custom_text_widget.dart';

class DairyPage extends StatefulWidget {
  const DairyPage({super.key});

  @override
  State<DairyPage> createState() => _DairyPageState();
}

class _DairyPageState extends State<DairyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("DAIRY", Colors.white),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 100,
            //   width:double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         child: TextField(
                      
                      
            //         ),
            //       ), 
            //        Container(
            //          child: TextField(
                      
            //       ),
            //        ), 
            //     ],
            //   ),
            // ), 
      
          SizedBox(height: 20.h,), 
      
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: ListView.builder(
                 itemCount: 4,
                 itemBuilder: ((context, index) {
                   return   Card(
                    child: Container(
                     
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                    
                        title: customText("Bangla 1st Page", dark, 17.0, FontWeight.bold),
                        subtitle: customText("Bangla 1st Page Bangla 1st Page Bangla 1st Page Bangla 1st PageBangla 1st Page",
                         dark, 13.0, FontWeight.w500),
                      ),
                    ),
                  );
                 }),
              ),
            ),
          )
      
          ],
        ),
      ),
    );
  }
}