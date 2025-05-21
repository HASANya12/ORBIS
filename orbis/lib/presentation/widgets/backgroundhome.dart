import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/class/cliphome.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';


class Backgroundhome extends StatelessWidget {
  const Backgroundhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Cliphome3(),
          child: Container(
            color: AppColor().baiscblue1.withAlpha(90),
            height: Responsive(context).hight * 0.4,
          ),
        ),
        ClipPath(
          clipper: Cliphome2(),
          child: Container(
            color: AppColor().baiscblue1.withAlpha(100),
            height: Responsive(context).hight * 0.3,
          ),
        ),
        ClipPath(
          clipper: Cliphome1(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor().baiscblue1,
              boxShadow: [BoxShadow(color: Colors.white, spreadRadius: -0.1)],
            ),

            height: Responsive(context).hight * 0.3,
          ),
        ),
      ],
    );
  }
}
