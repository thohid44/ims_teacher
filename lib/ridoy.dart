// import 'package:calculator/Butt_ons.dart';
// import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// String? userQuestion;
//   var userAnswer = '';

//   final List<String> buttons = [
//     'C',
//     'AC',
//     '%',
//     '/',
//     '9',
//     '8',
//     '7',
//     'x',
//     '6',
//     '5',
//     '4',
//     '-',
//     '3',
//     '2',
//     '1',
//     '+',
//     '0',
//     '.',
//     'ANS',
//     '=',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffFFA7A9AF),
//       body: Column(children: <Widget>[
//         Expanded(
//             child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                   padding: EdgeInsets.all(20),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     userQuestion,
//                     style: TextStyle(fontSize: 20),
//                   )),
//               Container(
//                   padding: EdgeInsets.all(20),
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     userAnswer,
//                     style: TextStyle(fontSize: 20),
//                   ))
//             ],
//           ),
//         )),
//         Expanded(
//             flex: 2,
//             child: Container(
//                 child: GridView.builder(
//                     itemCount: buttons.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4),
//                     itemBuilder: (BuildContext context, int index) {
//                       if (index == 0) {
//                         return MyButton(
//                             buttonTapped: () {
//                               setState(() {
//                                 userQuestion = '';
//                               });
//                             },
//                             buttonText: buttons[index],
//                             Color: Colors.green,
//                             textColor: Colors.white);
//                       } else if (index == 1) {
//                         return MyButton(
//                             buttonTapped: () {
//                               setState(() {
//                                 userQuestion = userQuestion.substring(
//                                     0, userQuestion.length - 1);
//                               });
//                             },
//                             buttonText: buttons[index],
//                             Color: Colors.red,
//                             textColor: Colors.white);
//                       }
//                       // Euqal Button
//                       else if (index == buttons.length - 1) {
//                         return MyButton(
//                             buttonTapped: () {
//                               setState(() {
//                                 equalTapped();
//                               });
//                             },
//                             buttonText: buttons[index],
//                             Color: Colors.deepPurple,
//                             textColor: Colors.white);
//                       } else {
//                         return MyButton(
//                             buttonTapped: () {
//                               setState(() {
//                                 userQuestion += buttons[index];
//                               });
//                             },
//                             buttonText: buttons[index],
//                             Color: isOperator(buttons[index])
//                                 ? Colors.deepPurple
//                                 : Colors.deepPurple[50],
//                             textColor: isOperator(buttons[index])
//                                 ? Colors.white
//                                 : Colors.deepPurple);
//                       }
//                     })))
//       ]),
//     );
//   }
// }

// bool isOperator(String x) {
//   if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
//     return true;
//   }
//   return false;
// }
// String? userQuestion;
// void equalTapped() {
  
//   String finalQuestion = userQuestion!;
//   finalQuestion = finalQuestion.replaceAll('x', '*');
//   Parser p = Parser();
//   Expression exp = p.parse(finalQuestion);
//   ContextModel cm = ContextModel();
//   double evel = exp.evaluate(EvaluationType.REAL, cm);
//   userAnswer = evel.toString();
// }