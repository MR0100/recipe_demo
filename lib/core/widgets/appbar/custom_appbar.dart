import 'package:flutter/material.dart';

import '../../core.dart';

PreferredSizeWidget customAppBar({
  required String title,
  required BuildContext context,
  List<Widget>? actions,
  bool isBackButton = true,
  Color? backgroundColor,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.hPr(context)),
    child: Padding(
      padding: EdgeInsets.only(top: 10.0.hPr(context)),
      child: AppBar(
        centerTitle: true,
        leading: isBackButton
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0.wPr(context)),
                  child: Icon(
                    Icons.arrow_back,
                    color: VariableUtilities.theme.black,
                  ),
                ),
              )
            : null,
        backgroundColor: backgroundColor ?? VariableUtilities.theme.white,
        elevation: 0,
        title: Text(
          title,
          style: FontUtilities.style(fontSize: 18, fontWeight: FWT.bold),
        ),
        actions: actions != null
            ? [
                SizedBox(
                  height: 36.hPr(context),
                  child: Row(
                    children: actions,
                  ),
                )
              ]
            : null,
      ),
    ),
  );
}
