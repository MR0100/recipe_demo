import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? hintText;
  const CustomSearchTextField(
      {super.key,
      required this.controller,
      this.suffixIcon,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.hPr(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: VariableUtilities.theme.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: FontUtilities.style(
            fontSize: 13,
            fontWeight: FWT.medium,
            fontColor: VariableUtilities.theme.black,
          ),
          contentPadding: EdgeInsets.only(top: 14.hPr(context)),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
                top: 5.hPr(context),
                left: 19.wPr(context),
                right: 10.wPr(context)),
            child: const Icon(CupertinoIcons.search),
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
