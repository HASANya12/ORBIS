
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:orbis/domain/modle/mylistmodle.dart';
import 'package:orbis/presentation/widgets/backgroundwithcloudDrwer.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().skyblue,
      endDrawer: EndDrawerButton(),
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
            top: Responsive(context).hight * 0.27,
            right: Responsive(context).width * 0.05,
            child: IconButton(
              alignment: Alignment(0, -2),

              onPressed: () {
                showModalBottomSheet(
                  enableDrag: true,
                  scrollControlDisabledMaxHeightRatio: 0.7,
                  showDragHandle: true,

                  sheetAnimationStyle: AnimationStyle(duration: 500.ms),
                  context: context,
                  builder:
                      (context) => SizedBox(
                        height: Responsive(context).hight * 0.9,
                        width: Responsive(context).width * 0.95,
                        child: ListView(
                          children: [
                            Center(
                              child: Textwithborder(
                                text: "New Note",
                                fonysize: 24,
                                textcolor: AppColor().baiscblue,
                                outlinecolor: AppColor().blackblue1,
                              ),
                            ),
                            Container(
                              height: Responsive(context).hight * 0.3,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: AppColor().baiscblue),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    spreadRadius: -1,
                                  ),
                                ],
                              ),
                              child: TextField(decoration: InputDecoration()),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 300),
                              child: Textwithborder(
                                text: "ok",
                                fonysize: 24,
                                textcolor: AppColor().baiscblue,
                                outlinecolor: AppColor().blackblue1,
                              ),
                            ),
                          ],
                        ),
                      ),
                );
              },
              icon: Icon(
                Icons.library_add,
                size: 24,

                color: AppColor().baiscblue2,
              ),
            ),
          ),

          ///
          Positioned(
            right: Responsive(context).width * 0.05,
            child: Image.asset(
              "assets/images/polariseithplanet.png",
              height: Responsive(context).hight * 0.23,
            ),
          ),
          ////////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.23,
            left: Responsive(context).width * 0.23,
            child: Text(
              "My List ",
              style: TextStyle(
                color: AppColor().baiscblue,
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

          ///////////////////////////////////
          Positioned(
            top: Responsive(context).hight * 0.30,
            child: SizedBox(
              height: Responsive(context).hight * 0.9,
              width: Responsive(context).width,
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder:
                    (context, index) => Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: AppColor().baiscblue),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: -1,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          mylist[index].title,
                          style: TextStyle(
                            color: AppColor().blackblue1,
                            fontFamily: "MPLUSRounded1c",
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              mylist[index].date,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: AppColor().gray,
                              ),
                            ),
                            Text(
                              "Passport or ID:${mylist[index].id}",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: AppColor().gray,
                              ),
                            ),
                          ],
                        ),
                        leading: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check_circle_rounded,
                            color:
                                mylist[index].done
                                    ? AppColor().baiscblue2
                                    : AppColor().gray,
                          ),
                        ),
                        // isThreeLine: true,
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/edit.png"),
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
