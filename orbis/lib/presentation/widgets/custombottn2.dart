import 'package:flutter/material.dart';
import 'package:orbis/utils/helper/color.dart';

class Custombottn2 extends StatelessWidget {
  void Function() onTap;
  double height;
  double? width;
  String text;
  Color? boxcolor;
  Custombottn2({
    super.key,
    required this.onTap,
    required this.height,
    this.width,
    required this.text,
    this.boxcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment(0, 0),
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          // color: boxcolor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: AppColor().baiscblue2),
            // BoxShadow(
            //   color: Colors.white,
            //   offset: Offset(0, 4),
            //   blurRadius: 4,
            //   spreadRadius: -1,
            // ),
            BoxShadow(
              color: AppColor().baiscblue2,
              offset: Offset(0, 5),
              blurRadius: 4,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColor().baiscblue2,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: "MPLUSRounded1c",
          ),
        ),
      ),
    );
  }
}
