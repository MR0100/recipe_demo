import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core.dart';

class CustomContainer extends StatelessWidget {
  final String? imageName;
  final double width;
  final double height;
  const CustomContainer(
      {super.key, this.imageName, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: VariableUtilities.theme.gray, width: 1)),
        child: Center(
            child: imageName == null
                ? const Icon(Icons.arrow_back)
                : SvgPicture.asset(
                    imageName!,
                    height: 24.hPr(context),
                    width: 24.wPr(context),
                  )));
  }
}
