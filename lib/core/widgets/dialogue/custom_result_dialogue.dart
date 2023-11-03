import 'package:flutter/material.dart';

import '../../asset/assets.dart';
import '../../core.dart';

enum ResultType { success, error }

class CustomResultDialogue {
  static void show(
    context, {
    required ResultType resultType,
    String? title,
    String? description,
    bool showLoading = false,
  }) =>
      showDialog(
          context: context,
          builder: (context) {
            return CustomResultDialogueWidget(
              resultType: resultType,
              description: description,
              title: title,
              showLoading: showLoading,
            );
          });
}

class CustomResultDialogueWidget extends StatelessWidget {
  final ResultType resultType;
  final String? title;
  final String? description;
  final bool showLoading;
  const CustomResultDialogueWidget({
    super.key,
    required this.resultType,
    required this.showLoading,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    Widget badge = Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: resultType == ResultType.success
            ? VariableUtilities.theme.blue
            : VariableUtilities.theme.red,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        resultType == ResultType.success
            ? AssetUtilities.resultSuccessImage
            : AssetUtilities.resultFailedImage,
        height: 70,
        width: 70,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: VariableUtilities.theme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          width: 300,
          constraints: const BoxConstraints(minHeight: 400, maxWidth: 300),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              badge,
              if (title != null) ...{
                const SizedBox(height: 20),
                Text(
                  title!,
                  style: FontUtilities.style(
                    fontSize: 24,
                    fontWeight: FWT.bold,
                    fontColor: VariableUtilities.theme.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              },
              if (description != null) ...{
                const SizedBox(height: 20),
                Text(
                  description!,
                  style: FontUtilities.style(
                    fontSize: 14,
                    fontWeight: FWT.regular,
                    fontColor: VariableUtilities.theme.darkGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              },
              if (showLoading) ...{
                const SizedBox(height: 20),
                LottieUtilities.loadingIndicator02(),
              },
            ],
          ),
        ),
      ],
    );
  }
}
