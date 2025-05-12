import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cloudwidget extends StatelessWidget {
  double hight;
  double width;
   Cloudwidget({super.key,required this.hight,required this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(  
      top: hight ,
      left: width ,
      child: SvgPicture.asset("asset/images/cloud.svg"),
    );
  }
}
