import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';


class Lightanddark extends StatefulWidget {
  const Lightanddark({super.key});

  @override
  State<Lightanddark> createState() => _LightanddarkState();
}

class _LightanddarkState extends State<Lightanddark> {
  double left = -10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Container(
        height: Responsive(context).hight * 0.03,
        width: 59,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:
              left == -10
                  ? AppColor().baiscblue2
                  : Color.fromARGB(223, 8, 39, 67),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeOut,
              top: -9,
              left: left,
              duration: 500.ms,
              child: GestureDetector(
                onTap: () {
                  print(left == 26 ? "light" : "dark");
                  setState(() {
                    left = left == 26 ? left = -10 : left = 26;
                  });
                },
                child: Image.asset(
                  left == -10
                      ? "assets/images/Sun.png"
                      : "assets/images/moon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeOut,
              duration: 500.ms,
              top: 8,
              left: left == -10 ? 35 : 60,
              child: Image.asset("assets/images/Cloud a.png"),
            ),
            AnimatedPositioned(
              curve: Curves.easeOut,
              duration: 500.ms,
              top: 1,
              left: left == -10 ? 19 : 70,
              child: Image.asset("assets/images/Cloud c.png"),
            ),
            AnimatedPositioned(
              curve: Curves.easeOut,
              duration: 500.ms,
              top: 16,
              left: left == -10 ? 19 : 70,
              child: Image.asset("assets/images/Cloud b.png"),
            ),
            AnimatedPositioned(
              curve: Curves.easeOut,
              duration: 500.ms,
              top: 5,
              left: left == 26 ? -7 : -50,
              child: Image.asset("assets/images/Star.png"),
            ),
          ],
        ),
      ),
    );
  }
}
