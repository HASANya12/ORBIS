import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbis/domain/modle/offersmodle.dart';
import 'package:orbis/presentation/widgets/backgroundwithcloudDrwer.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';


class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().skyblue,

      body: Stack(
        children: [
          Positioned(
            top: Responsive(context).hight * 0.08,
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
          // Positioned(
          //   right: screenSize(context).width * 0.05,
          //   child: Image.asset(
          //     "assets/images/polariseithplanet.png",
          //     height: screenSize(context).hight * 0.23,
          //   ),
          // ),
          ////////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.07,
            left: Responsive(context).width * 0.18,
            child: Text(
              "Offers ",
              style: TextStyle(
                color: AppColor().baiscblue2,
                fontFamily: "MPLUSRounded1c",
                fontSize: 48,
                fontWeight: FontWeight.w400,
                shadows: [
                  BoxShadow(
                    color: AppColor().baiscblue2,
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          ////////////////////////////////////

          ///////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.2,
            child: SizedBox(
              height: Responsive(context).hight * 0.9,
              width: Responsive(context).width,
              child: ListView.builder(
                itemCount: offers.length,
                itemBuilder:
                    (context, index) => Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColor().baiscblue,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          offers[index].typ,
                          style: TextStyle(
                            color: AppColor().blackblue1,
                            fontFamily: "MPLUSRounded1c",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          offers[index].discrption,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColor().gray,
                          ),
                        ),
                        leading: SvgPicture.asset(offers[index].image,)  ,
                        // isThreeLine: true,
                        trailing: IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),

                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor().baiscblue2,
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
