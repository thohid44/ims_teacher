import 'package:flutter/material.dart';

import 'mylistitems.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Switch List"),),
      body: Padding(padding: const EdgeInsets.all(10), child: ListView.builder(
      itemCount:10,
      shrinkWrap: true,
      itemBuilder: (ctx,i){
      return MyListItems(title:i.toString());
    }),)
    );

    
  }
}