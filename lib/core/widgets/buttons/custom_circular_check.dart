import 'package:flutter/material.dart';

import '../../core.dart';

class CustomCircularCheck extends StatelessWidget {
  final bool isChecked;
  final Color? color;
  const CustomCircularCheck({super.key, required this.isChecked, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.hPr(context),
      width: 16.hPr(context),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: color ?? VariableUtilities.theme.blue, width: 1),
          color: isChecked
              ? color ?? VariableUtilities.theme.blue
              : VariableUtilities.theme.transparent),
      child: isChecked
          ? Icon(
              Icons.check,
              size: 12.hPr(context),
              color: VariableUtilities.theme.white,
            )
          : const SizedBox.shrink(),
    );
  }
}
