import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbis/presentation/widgets/backgroundonbording.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';

class OnbordingtwoScreen extends StatelessWidget {
  const OnbordingtwoScreen({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().skyblue,
      body: Stack(
        children: [
          Background(),
          Positioned(
            bottom: Responsive(context).hight * 0.13,
            child: SizedBox(
              height: Responsive(context).hight * 0.5,
              width: Responsive(context).width,
              child: SvgPicture.asset(
                    "asset/images/skip2.svg",
                    fit: BoxFit.fill,
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  // .fade(duration: 700.ms)
                  .slide(duration: 700.ms, begin: Offset(0, 0.1)),
            ),
          ),
          Positioned(
            top: Responsive(context).hight * 0.1,
            left: Responsive(context).width * 0.13,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textwithborder(
                  text:
                      "Every place has a story\n\t\t\t\t\tand Orbis is your\n\t\t\t\t\t\t\t\t\t\t\t\t guide!",
                  fonysize: 24,
                  textcolor: AppColor().baiscblue,
                  outlinecolor: AppColor().outline,
                  withshdaw: true,
                ).animate().fade(duration: 700.ms).slide(begin: Offset(0, -1)),
                Text(
                  "\t\t\t\t\tIt will reveal cities,\n\t\t\tlandmarks, and places\n near you in a simple and\n\t\t\t\t\t\t\t\tattractive way.",
                  style: TextStyle(
                    color: AppColor().blackblue1,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    fontFamily: "MPLUSRounded1c",
                  ),
                ).animate().fade(duration: 700.ms).slide(begin: Offset(0, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
