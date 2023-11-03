import 'package:flutter/material.dart';

import '../../core.dart';

class CustomCheckButton extends StatelessWidget {
  final int selectedIndex;
  final int currentIndex;
  final String title;
  final VoidCallback onTap;

  const CustomCheckButton(
      {super.key,
      required this.currentIndex,
      required this.selectedIndex,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: selectedIndex == currentIndex
                  ? VariableUtilities.theme.black
                  : VariableUtilities.theme.white,
              border:
                  Border.all(color: VariableUtilities.theme.gray, width: 1.5),
              borderRadius: BorderRadius.circular(10)),
          height: 44.hPr(context),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
              child: Text(
                title,
                style: FontUtilities.style(
                    fontSize: 14,
                    fontWeight: selectedIndex == currentIndex
                        ? FWT.semiBold
                        : FWT.medium,
                    fontColor: selectedIndex == currentIndex
                        ? VariableUtilities.theme.white
                        : VariableUtilities.theme.black),
              ),
            ),
          )),
    );
  }
}
