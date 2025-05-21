import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/Cloudwidget.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().skyblue,
      body: Stack(
        children: [
          Cloudwidget(
            hight: Responsive(context).hight * 0.1,
            width: Responsive(context).width * 0.2,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.1,
            width: Responsive(context).width * 0.8,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.35,
            width: Responsive(context).width * 0.01,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.35,
            width: Responsive(context).width * 0.7,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.7,
            width: Responsive(context).width * 0.08,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.9,
            width: Responsive(context).width * 0.12,
          ),
        ],
      ),
    );
  }
}
