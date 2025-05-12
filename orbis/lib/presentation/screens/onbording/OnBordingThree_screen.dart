import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbis/presentation/widgets/backgroundonbording.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';

class OnbordingthreeScreen extends StatelessWidget {
  const OnbordingthreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Positioned(
            top: Responsive(context).hight * 0.03,
            // left: screenSize(context).width * 0.1,
            child: SvgPicture.asset(
              "asset/images/Group31.svg",
            ).animate().scaleXY(duration: 700.ms),
          ),
          Positioned(
            top: Responsive(context).hight * 0.06,
            left: Responsive(context).width * 0.2,
            child: SvgPicture.asset(
              "asset/images/skip3.svg",
              height: Responsive(context).hight * 0.38,
            ),
          ).animate().scaleXY(duration: 700.ms),
          Positioned(
            top: Responsive(context).hight * 0.3,
            right: Responsive(context).width * 0.018,
            child: SvgPicture.asset(
              "asset/images/Group32.svg",
              height: Responsive(context).hight * 0.25,
            ),
          ).animate().scaleXY(duration: 700.ms),
          Positioned(
            top: Responsive(context).hight * 0.43,
            left: Responsive(context).width * 0.1,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textwithborder(
                  text:
                      "Ready to go? The world is\n\t\t\t\t\t\tat your fingertips!\n",
                  fonysize: 24,
                  textcolor: AppColor().baiscblue,
                  outlinecolor: AppColor().outline,
                  withshdaw: true,
                ).animate().fade(duration: 700.ms).slide(begin: Offset(0, -1)),

                Text(
                  "Start your journey now\n and discover how many\n\t\t amazing things the\n world has waiting for\n\t\t\t\t\t\t\t\t\t\t\t\t you!",
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
