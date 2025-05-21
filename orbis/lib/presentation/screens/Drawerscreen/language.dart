import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/custombottn2.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                        backgroundColor: Colors.white,
                        elevation: 1000,
                        titlePadding: EdgeInsets.only(
                          left: 40,
                          top: 40,
                          bottom: 10,
                        ),
                        title: Textwithborder(
                          text: "Choose a language",
                          fonysize: 27,
                          textcolor: AppColor().baiscblue2,
                          outlinecolor: AppColor().blackblue,
                        ),

                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Custombottn2(
                              onTap: () {},
                              height: Responsive(context).hight * 0.065,
                              width: Responsive(context).width * 0.6,
                              text: "English",
                              boxcolor: Colors.white70,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Custombottn2(
                              onTap: () {},
                              height: Responsive(context).hight * 0.065,
                              width: Responsive(context).width * 0.6,
                              text: "Arabic",
                              boxcolor: Colors.white70,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Textwithborder(
                                text: "Ok",
                                fonysize: 24,
                                textcolor: AppColor ().baiscblue2,
                                outlinecolor: AppColor().black,
                              ),
                            ),
                          ),
                        ],
                      );
  }
}