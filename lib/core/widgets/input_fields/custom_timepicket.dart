import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

Future<Duration?> customTimePicker(BuildContext context) async {
  Duration duration = const Duration(hours: 6, minutes: 0);
  await showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 24.wPr(context)),
        child: SizedBox(
          height: 250.hPr(context),
          child: CupertinoTimerPicker(
            onTimerDurationChanged: (v) {
              duration = v;
            },
            initialTimerDuration: const Duration(hours: 6, minutes: 0),
          ),
        ),
      );
    },
  );
  return duration;
}
