import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/backgroundwithcloudDrwer.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Rateus extends StatefulWidget {
  const Rateus({super.key});

  @override
  State<Rateus> createState() => _RateusState();
}

class _RateusState extends State<Rateus> {
  int indexslect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().skyblue,
      body: Stack(
        children: [
          Positioned(
            top: Responsive(context).hight * 0.07,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.chevron_left, size: 30, color: AppColor().black),
            ),
          ),
          ///////////////////////////////////////////////////
          Backgroundwithcloud(),
          ////////////////////////////////////////////////////
          Positioned(
            right: Responsive(context).width * 0.05,
            child: Image.asset(
              "assets/images/polariseithplanet.png",
              height: Responsive(context).hight * 0.23,
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.3,
            left: Responsive(context).width * 0.04,
            child: Textwithborder(
              text: "Enjoying Orbis?",
              fonysize: 36,
              textcolor: AppColor().baiscblue2,
              outlinecolor: AppColor().black,
            ),
          ),
          ///////////////////////////////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.4,
            left: Responsive(context).width * 0.08,
            child: Text(
              "We hope you're loving your travel \nexperiences with us! \nIf you have a moment, please \nleave us a review. \nYour feedback helps us improve \nand inspire more journeys around \nthe world.",
              style: TextStyle(
                fontFamily: "MPLUSRounded1c",

                fontWeight: FontWeight.w400,
                color: AppColor().blackblue,
                fontSize: 22,
              ),
            ),
          ),
          /////////////////////////////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.7,
            child: Row(
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    print(index);
                    setState(() {
                      indexslect = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.star_rounded,
                      size: 40,
                      color:
                          index <= indexslect
                              ? Color(0xF1FFCC00)
                              : Color(0xF1FFCC00).withAlpha(90),
                      fill: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          /////////////////////////////////////////////////////////
          Positioned(
            bottom: Responsive(context).hight * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Custombottn(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    height: Responsive(context).hight * 0.05,
                    width: Responsive(context).width * 0.4,
                    text: "mabya later ",
                    boxcolor: AppColor().grayblue,
                    withshadow: true,
                  ),
                ),
                //////////////////////////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Custombottn(
                    onTap: () {},
                    height: Responsive(context).hight * 0.05,
                    width: Responsive(context).width * 0.4,
                    text: "rate us ",
                    boxcolor: AppColor().baiscblue2,
                    withshadow: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
