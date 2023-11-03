import 'package:flutter/widgets.dart';

import '../../core.dart';

class CustomSocialButton extends StatelessWidget {
  final String? title;
  final String imagePath;
  final VoidCallback? onTap;
  const CustomSocialButton(
      {super.key, required this.imagePath, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.hPr(context),
        width: title != null ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: VariableUtilities.theme.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: VariableUtilities.theme.gray, width: 1)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: 25.hPr(context),
                width: 25.hPr(context),
              ),
              if (title != null) ...{
                const SizedBox(width: 16),
                Text(
                  title!,
                  style: FontUtilities.style(
                    fontSize: 18,
                    fontWeight: FWT.regular,
                    fontColor: VariableUtilities.theme.black,
                  ),
                )
              },
            ]),
      ),
    );
  }
}
