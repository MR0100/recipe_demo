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
      height: 50.hPr(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: VariableUtilities.theme.white,
        borderRadius: BorderRadius.circular(40),
        border:
            Border.all(color: VariableUtilities.theme.gray.withOpacity(0.2)),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: FontUtilities.style(
            fontSize: 14,
            fontColor: VariableUtilities.theme.gray,
          ),
          contentPadding: EdgeInsets.only(top: 14.hPr(context)),
          prefixIcon: Padding(
            padding:
                EdgeInsets.only(left: 20.wPr(context), right: 10.wPr(context)),
            child: Icon(
              CupertinoIcons.search,
              color: VariableUtilities.theme.gray,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalDivider(
                      endIndent: 10.hPr(context),
                      indent: 10.hPr(context),
                      thickness: 1,
                      width: 0,
                      color: VariableUtilities.theme.gray.withOpacity(0.2),
                    ),
                    SizedBox(width: 10.wPr(context)),
                    suffixIcon!,
                    SizedBox(width: 20.wPr(context)),
                  ],
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
