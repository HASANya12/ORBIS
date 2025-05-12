import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbis/presentation/widgets/backgroundonbording.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';

class OnbordingoneScreen extends StatelessWidget {
  const OnbordingoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SvgPicture.asset("asset/images/Group1.svg"),
          Positioned(
                top: Responsive(context).hight * 0.1,
                child: SizedBox(
                  height: Responsive(context).hight * 0.45,
                  width: Responsive(context).width * 0.9,
                  child: SvgPicture.asset("asset/images/skip1.svg"),
                  // Lottie.asset("assets/rive/file(11) 1.json"),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              // .fade(duration: 700.ms)
              .slide(duration: 700.ms, begin: Offset(0, 0.1)),
          Positioned(
            top: Responsive(context).hight * 0.4,
            right: 0,
            child: SvgPicture.asset("asset/images/Group12.svg"),
          ),
          Positioned(
            top: Responsive(context).hight * 0.43,
            left: Responsive(context).width * 0.1,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textwithborder(
                  
                  text:
                      "  \t\t Discover the world\n around you in a fun way!\n ",
                  fonysize: 24,
                  textcolor: AppColor().baiscblue,
                  outlinecolor: AppColor().outline,
                  withshdaw: true,
                ).animate().fade(duration: 700.ms).slide(begin: Offset(0, -1)),
                Text(
                  "\t\t\tOrbis brings together \n\t\t\t\t\tplaces, stories, and\n\t\t\t\t\t information in an\ninteractive way that gives \n\tyou a unique experience\n\t\t\t\t\t with every step.",
                  style: TextStyle(
                    color: AppColor().blackblue1,
                    fontSize: 24,
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
