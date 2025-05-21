import 'package:flutter/material.dart';
import 'package:orbis/presentation/screens/appscreens/Favorite_screen.dart';
import 'package:orbis/presentation/screens/appscreens/Home_screen.dart';
import 'package:orbis/presentation/screens/appscreens/Location_screen.dart';
import 'package:orbis/presentation/screens/appscreens/Profile_screen.dart';
import 'package:orbis/presentation/widgets/class/clipnavbar.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int indexslected = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navbar[indexslected],
      appBar: AppBar(
        toolbarHeight: 27,
        backgroundColor:
             indexslected == 2 ? AppColor().baiscblue1 : Colors.white,
      ),
      // drawer: Customdrower(),

      bottomNavigationBar: Container(
        height: Responsive(context).hight * 0.06,
        width: Responsive(context).width * 0.9,
        margin: EdgeInsets.only(left: 35, right: 15, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColor().baiscblue.withAlpha(100),
              offset: Offset(0, 5),
              blurRadius: 20,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            iconvabar.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  indexslected = index;
                });
              },
              child: Column(
                //   mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),

                    height: Responsive(context).hight * 0.017,
                    width: indexslected == index ? 32.4 : 0,
                    decoration: BoxDecoration(
                      boxShadow:
                          indexslected == index
                              ? [
                                BoxShadow(
                                  color: AppColor().skyblue,
                                  offset: Offset(0, 17),
                                  spreadRadius: 14,
                                  blurRadius: 19,
                                ),
                              ]
                              : [],
                    ),
                    child: ClipPath(
                      clipper: Clipnavbar(),
                      child: Container(color: AppColor().baiscblue),
                    ),
                  ),
                  Image.asset(
                    height: Responsive(context).hight * 0.043,
                    iconvabar[index],
                    color: indexslected == index ? AppColor().baiscblue : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List iconvabar = [
  "assets/images/Shape.png",
  "assets/images/heart.png",
  "assets/images/Home 2.png",
  "assets/images/booking.png",
  "assets/images/profle.png",
];

List navbar = [
  LocationScreen(),
  FavoriteScreen(),
  HomeScreen(),
  // BookingScreen(),
  ProfileScreen(),
];
