import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class Responsive {
  late double hight;
  late double width;


   Responsive(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
