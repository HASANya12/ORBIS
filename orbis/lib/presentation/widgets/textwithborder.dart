import 'package:flutter/cupertino.dart';
import 'package:orbis/utils/helper/color.dart';

class Textwithborder extends StatelessWidget {
  String text;
  double fonysize;
  Color outlinecolor; 
  Color textcolor;
  bool? withshdaw;
  Color? color ;
  Textwithborder({
    super.key,
    required this.text,
    required this.fonysize,
    required this.textcolor,
    required this.outlinecolor,
    this.withshdaw,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // border
        Text(
          text,
          style: TextStyle(
            fontSize: fonysize,
            fontWeight: FontWeight.w800,
            fontFamily: "MPLUSRounded1c",
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = outlinecolor,
          ),
        ),
        // text
        Text(
          text,
          style: TextStyle(
            fontSize: fonysize,
            fontWeight: FontWeight.w800,
            color: textcolor,
            fontFamily: "MPLUSRounded1c",

            shadows:
                withshdaw != null
                    ? [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: color??= AppColor().blackblue,
                      ),
                    ]
                    : [],
          ),
        )
      ],
    );
  }
}