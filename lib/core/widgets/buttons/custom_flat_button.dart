import 'package:flutter/material.dart';

import '../../core.dart';

class CustomFlatButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final VoidCallback? onTap;
  const CustomFlatButton(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.width,
      this.textColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: backgroundColor ?? VariableUtilities.theme.darkPurple,
        child: InkWell(
          onTap: onTap,
          splashColor: VariableUtilities.theme.white.withOpacity(.5),
          child: Container(
            height: 54.hPr(context),
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: VariableUtilities.theme.transparent,
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: FontUtilities.style(
                fontSize: 16,
                fontWeight: FWT.bold,
                fontColor: textColor ?? VariableUtilities.theme.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
