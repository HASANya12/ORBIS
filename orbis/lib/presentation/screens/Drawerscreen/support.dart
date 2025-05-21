
import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/backgroundwithcloudDrwer.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';
class Support extends StatelessWidget {
  const Support({super.key});

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
          ////////////////////////////////
          Backgroundwithcloud(),
          ////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.1,
            left: Responsive(context).width * 0.1,
            child: Textwithborder(
              text: "Welcome ORBIS",
              fonysize: 36,
              textcolor: AppColor().baiscblue2,
              outlinecolor: AppColor().black,
            ),
          ),

          /////////////////////////////////
          ///
          Positioned(
            top: Responsive(context).hight * 0.18,
            child: Container(
              padding: EdgeInsets.only(left: 20, bottom: 150),
              height: Responsive(context).hight,
              width: Responsive(context).width,
              child: ListView(
                children: [
                  Text(
                    "Welcome to Orbis — Your Gateway\nto the World.\nAt Orbis, we believe that travel \nshould be easy, exciting, and \naccessible for everyone. Our \nplatform helps you discover and \nbook the best tours, tickets, and \nexperiences across the globe — all \nin one place.\nOur Mission\nWe are here to simplify tourism \nmanagement, connect travelers \nwith unforgettable adventures, and \nmake every journey smoother and\nmore memorable.\nWhat We Offer\n\t Easy and fast ticket booking \n\tCrated tours and experiences\n\tTrusted partners and exclusive \ndeals \n\t24/7 customer support to \n\tassist you anytime\nWhy Orbis? \nBecause your journey deserves \nmore than just a ticket — it \ndeserves care, passion, and \nexpertise.\n With Orbis, you can explore with \nconfidence, knowing we’re with you \nevery step of the way.\nLet's make your next adventure\nunforgettable.\n Need help? \nContact us at\nWelcome to Orbis — Your Gateway \nto the World.\nAt Orbis, we believe that travel \nshould be easy, exciting, and \naccessible for everyone. Our \nplatform helps you discover and\nbook the best tours, tickets, and \nexperiences across the globe — all \nin one place.\nOur Mission\nWe are here to simplify tourism \nmanagement, connect travelers \nwith unforgettable adventures, and \n mack every journey smoother and\nmore memorable.\nWhat We Offer\n\t Easy and fast ticket booking \n\tCrated tours and experiences\n\tTrusted partners and exclusive \ndeals \n\t24/7 customer support to \n\tassist you anytime\nWhy Orbis?\nBecause your journey deserves \nmore than just a ticket — it \ndeserves care, passion, and \nexpertise.\n With Orbis, you can explore with \nconfidence, knowing we’re with you \nevery step of the way.\nLet's make your next adventure\nunforgettable.\n Need help? \nContact us at",

                    style: TextStyle(
                      fontFamily: "MPLUSRounded1c",

                      fontWeight: FontWeight.w400,
                      color: AppColor().blackblue,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "support@orbisapp.com",
                    style: TextStyle(
                      color: AppColor().blackblue1,
                      fontFamily: "MPLUSRounded1c",
                      fontSize: 24,
                      shadows: [
                        BoxShadow(
                          color: AppColor().shadow,
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
