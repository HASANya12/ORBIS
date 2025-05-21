import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/utils/helper/color.dart';

class Customdialog extends StatelessWidget {
  String title;
  String subtitle;
  List<Custombottn> bottons;

  Customdialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bottons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColor().black,
              fontFamily: "MPLUSRounded1c",
              fontSize: 20,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor().gray,
              fontFamily: "MPLUSRounded1c",
            ),
          ),
          ListBody(children: bottons),
        ],
      ),
    );
  }
}
