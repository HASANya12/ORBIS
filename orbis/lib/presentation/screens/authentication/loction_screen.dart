import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class LoctionScreen extends StatelessWidget {
  const LoctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SvgPicture.asset("asset/images/Navigation-amico 1.svg"),

          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: SvgPicture.asset(
              "asset/images/cloud.svg",
              color: AppColor().babyblue,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Custombottn(
              withshadow: true,
              onTap: () {
                Navigator.pushNamed(context, "/MapScreen");
              },
              height: 54,
              width: Responsive(context).width,
              text: "chose your location",
              boxcolor: AppColor().baiscblue,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Custombottn(
              withshadow: true,
              onTap: () {
               Navigator.pushNamedAndRemoveUntil(context, "/home", (route) =>false ,);
              },
              height: 54,
              width: Responsive(context).width,
              text: "skip",
              boxcolor: AppColor().grayblue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: SvgPicture.asset(
              "asset/images/cloud.svg",
              color: AppColor().babyblue,
            ),
          ),
        ],
      ),
    ); 
  }
} 
