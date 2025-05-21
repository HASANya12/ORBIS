import 'package:flutter/material.dart';
import 'package:orbis/utils/helper/color.dart';

class Custombottn extends StatelessWidget {
  void Function() onTap;
  double height;
  double? width;
  String text;
  Color boxcolor;
  bool? withshadow;
  double? fontsize;
  Custombottn({
    super.key,
    required this.onTap,
    required this.height,
    this.width,
    required this.text,
    required this.boxcolor,
    this.withshadow,
    this.fontsize,
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
          color: boxcolor,
          borderRadius: BorderRadius.circular(15),
          boxShadow:
              withshadow == true
                  ? [
                    BoxShadow(
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      color: AppColor().baiscblue,
                    ),
                  ]
                  : [],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontsize ?? 22,
            fontWeight: FontWeight.w700,
            fontFamily: "MPLUSRounded1c",
          ),
        ),
      ),
    );
  }
}
