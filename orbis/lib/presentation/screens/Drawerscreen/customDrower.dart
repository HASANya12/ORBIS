import 'package:flutter/material.dart';
import 'package:orbis/presentation/screens/Drawerscreen/language.dart';
import 'package:orbis/presentation/screens/Drawerscreen/lightanddark.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Customdrower extends StatelessWidget {
  const Customdrower({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColor().baiscblue2, width: 2),

        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),

          // bottomRight: Radius.circular(0),
        ),
      ),

      shadowColor: AppColor().baiscblue2,
      elevation: 100,
      width: Responsive(context).width * 0.7,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppColor().baiscblue2, offset: Offset(0, 0)),

            BoxShadow(
              color: Colors.white,
              offset: Offset(-8, 12),
              blurRadius: 32,

              spreadRadius: 10,
            ),
          ],
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image.asset(
              "assets/images/polariseithplanet.png",
              height: Responsive(context).hight * 0.3,
            ),
            Center(
              child: Text(
                "User name ",
                style: TextStyle(
                  fontSize: 32,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w500,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),
            Center(
              child: Text(
                "User location",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w400,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),
            ///////////////////////////////////
            Divider(indent: 50, endIndent: 50),
            //////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Badge.count(
                    count: 5,
                    alignment: Alignment.topLeft,
                    offset: Offset(10, -8),
                    child: Icon(
                      Icons.notifications,
                      color: AppColor().baiscblue2,
                    ),
                  ),
                ),
                ///////light
                Lightanddark(),
              ],
            ),
            //////////////////////////////////////////
            ListTile(
              onTap: () {
                showDialog(
                  useRootNavigator: true,
                  routeSettings: RouteSettings(name: "/Offers"),

                  context: context,
                  builder:
                      (context) => GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/Offers");
                        },
                        child: AlertDialog(
                          icon: Image.asset(
                            "assets/images/polariseithplanet.png",
                            height: 150,
                            // alignment: Alignment(1.5, 0),
                          ),
                          backgroundColor: Colors.white,

                          content: Text(
                            "These are the places\nwhere points can be\nredeemed.",
                            style: TextStyle(
                              color: AppColor().baiscblue2,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              fontFamily: "MPLUSRounded1c",
                              shadows: [
                                BoxShadow(
                                  color: AppColor().baiscblue2,
                                  offset: Offset(0, 4),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                );

                // Navigator.pushNamed(context, "/Offers");
              },
              leading: Image.asset(
                "assets/images/Discount.png",
                color: AppColor().baiscblue2,
              ),
              title: Text(
                "offers",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w400,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),
            ////////////////////////////////////////////
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/Todolist");
              },
              leading: Image.asset(
                "assets/images/To Do List.png",
                color: AppColor().baiscblue2,
              ),
              title: Text(
                "my list",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w400,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),
            //////////////////////////////////////////////////
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => Language()
                );
              },
              leading: Icon(
                Icons.translate,
                size: 30,
                color: AppColor().baiscblue2,
              ),
              title: Text(
                "language",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w400,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),
            //////////////////////////////////////////
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/Rateus");
              },
              leading: Image.asset("assets/images/Star 2.png"),
              title: Text(
                "rate us",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w400,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),
            //////////////////////////////////////////
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/Support");
              },
              leading: Image.asset(
                "assets/images/Online Support.png",
                color: AppColor().baiscblue2,
              ),
              title: Text(
                "support",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor().blackblue1,
                  fontWeight: FontWeight.w400,
                  fontFamily: "MPLUSRounded1c",
                ),
              ),
            ),

            SizedBox(height: 20),
            //////////////////////////////////////////
            Divider(indent: 50, endIndent: 50),

            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 50),
              child: ListTile(
                onTap: () {},
                leading: Image.asset(
                  "assets/images/log-out.png",
                  height: 29,
                  color: AppColor().baiscblue2,
                ),
                title: Text(
                  "log out",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor().blackblue1,
                    fontWeight: FontWeight.w800,
                    fontFamily: "MPLUSRounded1c",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
