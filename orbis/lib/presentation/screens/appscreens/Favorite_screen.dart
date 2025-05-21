import 'package:flutter/material.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        titleSpacing: Responsive(context).width * 0.2,
        title: Text(
          "Favorite",
          style: TextStyle(
            fontSize: 32,
            fontFamily: "MPLUSRounded1c",
            fontWeight: FontWeight.w400, 
            color: AppColor().black,
          ),
        ),
      ),
      body:
          // journyList.isEmpty
              // ?
               Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/images/favorit.jpg"),
                      // SvgPicture.asset(
                      //   "assets/images/no Favourites.svg",
                      //   height: screenSize(context).hight * 0.3,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Text(
                      "No favorite journye yet",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w800,
                        color: AppColor().blackblue,
                      ),
                    ),
                    Text(
                      "All your  favorite journye  will ",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        color: AppColor().gray,
                      ),
                    ),
                    Text(
                      " show up here",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        color: AppColor().gray,
                      ),
                    ),
                  ],
                ),
              )
              // : GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //   ),
              //   itemCount: journyList.length,
              //   itemBuilder:
              //       (context, index) => Journy(journymodle: journyList[index]),
              // ),
    );
  }
}
