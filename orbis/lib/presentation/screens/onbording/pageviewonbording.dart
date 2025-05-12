import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbis/presentation/screens/onbording/OnBordingOne_screen.dart';
import 'package:orbis/presentation/screens/onbording/OnBordingThree_screen.dart';
import 'package:orbis/presentation/screens/onbording/OnBordingTwo_screen.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Pageviewonbording extends StatefulWidget {
  const Pageviewonbording({super.key});

  @override
  State<Pageviewonbording> createState() => _PageviewonbordingState();
}

class _PageviewonbordingState extends State<Pageviewonbording> {
  final PageController _pageController = PageController();
  bool isLastpage = false;
  int indexpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /////////////////////////////
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    0,
                    duration: 1000.ms,
                    curve: Easing.legacy,
                  );
                },
                child: AnimatedContainer(
                  duration: 500.ms,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AnimatedRotation(
                      duration: 500.ms,

                      turns: indexpage == 0 ? -0.5 : 0,
                      child: SvgPicture.asset(
                        "asset/images/indicator (2).svg",
                        height: indexpage == 0 ? 30 : 20,
                        width: indexpage == 0 ? 30 : 20,

                        color:
                            indexpage == 0
                                ? null
                                : AppColor().baiscblue.withAlpha(80),

                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              ////////////////////////////////////////
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    1,
                    duration: 1000.ms,
                    curve: Easing.legacy,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AnimatedRotation(
                    duration: 500.ms,

                    turns: indexpage == 1 ? -0.5 : 0,
                    child: SvgPicture.asset(
                      "asset/images/indicator (2).svg",
                      height: indexpage == 1 ? 30 : 20,
                      width: indexpage == 1 ? 30 : 20,

                      color:
                          indexpage == 1
                              ? null
                              : AppColor().baiscblue.withAlpha(80),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              //////////////////////////////////////////
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    2,
                    duration: 1000.ms,
                    curve: Easing.legacy,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AnimatedRotation(
                    duration: 500.ms,

                    turns: indexpage == 2 ? -0.5 : 0,
                    child: SvgPicture.asset(
                      "asset/images/indicator (2).svg",
                      height: indexpage == 2 ? 30 : 20,
                      width: indexpage == 2 ? 30 : 20,

                      color:
                          indexpage == 2
                              ? null
                              : AppColor().baiscblue.withAlpha(80),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: 1000.ms,
                    curve: Easing.legacy,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColor().baiscblue),
                  foregroundColor: WidgetStatePropertyAll(AppColor().white),
                ),
                child: Text(
                  "back",
                  style:  TextStyle(
                    color: AppColor().white,
                    fontFamily: "MPLUSRounded1c",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: Responsive(context).width * 0.4),
              ElevatedButton(
                onPressed: () async {
                  isLastpage
                      ? {
                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   "/singinScreen",
                        //   (route) => false,
                        // ),
                        //  await   CacheHelper().saveData(key: "watchingonboring", value: true)
                      }
                      : _pageController.nextPage(
                        duration: 1000.ms,
                        curve: Easing.legacy,
                      );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColor().baiscblue),
                  foregroundColor: WidgetStatePropertyAll(AppColor().white),
                ),
                child: Text(
                  isLastpage ? "Strat" : "next",
                  style: TextStyle(
                    color: AppColor().white,
                    fontFamily: "MPLUSRounded1c",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged:
            (value) => setState(() {
              indexpage = value;
              isLastpage = value == 2;
            }),
        children: [
          OnbordingoneScreen(),
          OnbordingtwoScreen(),
          OnbordingthreeScreen(),
        ],
      ),
    );
  }
}
