import 'package:flutter/material.dart';

import '../../core.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool? isObscureText;
  final String? labelText;
  final EdgeInsets? padding;
  final bool? isFromEditProfile;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.textInputType,
    this.isObscureText,
    this.labelText,
    this.padding,
    this.isFromEditProfile,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...{
            Text(labelText!,
                style: FontUtilities.style(
                  fontSize: 16,
                  fontWeight: FWT.medium,
                  fontColor: (isFromEditProfile ?? false)
                      ? VariableUtilities.theme.black
                      : VariableUtilities.theme.darkGray,
                )),
            SizedBox(height: 9.hPr(context)),
          },
          SizedBox(
            height: 54.hPr(context),
            width: double.infinity,
            child: TextFormField(
              readOnly: onTap != null ? true : false,
              controller: controller,
              onTap: onTap,
              keyboardType: textInputType,
              obscureText: isObscureText ?? false,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: VariableUtilities.theme.gray),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: VariableUtilities.theme.gray),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: VariableUtilities.theme.gray),
                  borderRadius: BorderRadius.circular(10),
                ),
                isDense: true,
                hintText: hintText ?? '',
                hintStyle: FontUtilities.style(
                  fontSize: 16,
                  fontWeight: FWT.medium,
                  fontColor: VariableUtilities.theme.gray,
                ),
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
