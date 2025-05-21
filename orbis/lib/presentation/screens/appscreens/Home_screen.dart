import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbis/presentation/widgets/backgroundhome.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Responsive(context).hight,
        child: Stack(
          children: [
            Backgroundhome(),

            Positioned(
              top: Responsive(context).hight * 0.02,
              left: Responsive(context).width * 0.1,
              child: Textwithborder(
                text: "ORBIS",
                fonysize: 45,
                textcolor: AppColor().baiscblue,
                outlinecolor: AppColor().darkbluae,
                withshdaw: true,
                color: Colors.white24,
              ),
            ),
            Positioned(
              left: Responsive(context).width * 0.43,
              top: Responsive(context).hight * 0.079,
              child: Image.asset("assets/images/Group main.png"),
            ),
            Positioned(
              left: Responsive(context).width * 0.47,
              top: Responsive(context).hight * 0.1 - 78,
              child: SvgPicture.asset("assets/images/Groupmain.svg"),
            ),
            Positioned(
              left: Responsive(context).width * 0.61,
              top: Responsive(context).hight * 0.1 - 98,
              child: SvgPicture.asset("assets/images/planee.svg"),
            ),

            ////////////////////////////////////////////////////////////////////////////
            Positioned(
              top: Responsive(context).hight * 0.15,
              // left: screenSize(context).width,
              child: SizedBox(
                height: Responsive(context).hight,
                width: Responsive(context).width,
                child: ListView(
                  children: [
                    Container(
                      height: Responsive(context).hight * 0.062,
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor().baiscblue),
                        boxShadow: [
                          BoxShadow(color: AppColor().baiscblue.withAlpha(120)),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: -1,
                          ),
                        ],
                      ),
                      // child: ,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 19, vertical: 0),
                      height: Responsive(context).hight * 0.3,
                      width: Responsive(context).width * 0.9,
                      // child:
                      //     flightTicketList.isEmpty
                      //         ? Fligthticket(
                      //           flightticketmodle: Flightticketmodle(
                      //             comapnyname: "",
                      //             date: "",
                      //             bookid: "0000",
                      //             type: "",
                      //             location: "",
                      //             tackofftime: "00:00",
                      //             landingtime: "00:00",
                      //             time: "0h 0m",
                      //           ),
                      //         )
                      //         : Fligthticket(
                      //           flightticketmodle: flightTicketList[0],
                      //         ),
                    ),

                    Row(
                      children: List.generate(
                        4,
                        (index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, pagecategory[index]);
                          },
                          child: Column(
                            children: [
                              Hero(
                                 tag: namectegory[index],
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        Responsive(context).width * 0.07,
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor().baiscblue.withAlpha(
                                          90,
                                        ),
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                        blurRadius: 5,
                                      ),
                                    ],
                                    color: AppColor().baiscblue.withAlpha(120),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: Responsive(context).hight * 0.05,
                                  width: Responsive(context).width * 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: SvgPicture.asset(catigories[index]),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  namectegory[index],
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: AppColor().baiscblue.withAlpha(
                                          100,
                                        ),
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                      ),
                                    ],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColor().blackblue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), 

                    Row(
                      // children: List.generate(
                        // journyList.length,
                        // (index) => Journy(journymodle: journyList[index]),
                      // ),
                    ),
                  ],
                ),
              ),
            ),

            ////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}

List catigories = [
  "assets/images/airplane.svg",
  "assets/images/buildings.svg",
  "assets/images/taxi.svg",
  "assets/images/fast-food.svg",
];
List namectegory = ["Flights", "Hotels", "Taxi", "Restaurant"];
List pagecategory = ["", "/Holttel", "", ""];
