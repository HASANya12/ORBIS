// import 'package:flutter/material.dart';
// import 'package:orbiss/color.dart';
// import 'package:orbiss/modle/journymodle.dart';

// class Journy extends StatelessWidget {
//   Journymodle journymodle;
//   Journy({super.key, required this.journymodle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: AppColor().baiscblue.withAlpha(100),
//             spreadRadius: -8,
//             blurRadius: 5,
//             offset: Offset(0, 16), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 100),
//           Text(journymodle.name),
//           Text(journymodle.location),

//           Text(journymodle.stars),
//           Text(journymodle.price),
//         ],
//       ),
//     );
//   }
// }
