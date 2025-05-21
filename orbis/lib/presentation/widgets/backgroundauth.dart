import 'package:flutter/material.dart';
import 'package:orbis/presentation/widgets/Cloudwidget.dart';
import 'package:orbis/utils/constant/Responsive.dart';

class Backgroundauuth extends StatelessWidget {
  const Backgroundauuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Cloudwidget(
            hight: Responsive(context).hight * 0.05,
            width: Responsive(context).width * 0.3,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.24,
            width: Responsive(context).width * 0.1,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.15,
            width: Responsive(context).width * 0.7,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.7,
            width: Responsive(context).width * 0.08,
          ),
          Cloudwidget(
            hight: Responsive(context).hight * 0.8,
            width: Responsive(context).width * 0.7,
          ),

      ],
    );
  }
}