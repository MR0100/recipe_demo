import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core.dart';

class CustomOtpField extends StatefulWidget {
  final Function(String) onSubmit;
  const CustomOtpField({required this.onSubmit, super.key});

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  String _getOtp() {
    String otp = '';
    for (var element in _controllers) {
      otp += element.text;
    }
    return otp;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          _controllers.length,
          (index) => Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: VariableUtilities.theme.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _controllers[index].text.isNotEmpty
                    ? VariableUtilities.theme.blue
                    : VariableUtilities.theme.gray,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              onTap: () {
                for (var element in _controllers) {
                  element.text = '';
                }
                _focusNodes[0].requestFocus();
                setState(() {});
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < _controllers.length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  } else {
                    widget.onSubmit(_getOtp());
                  }
                } else {
                  if (index != 0) {
                    _focusNodes[index - 1].requestFocus();
                  }
                }
                setState(() {});
              },
              textAlign: TextAlign.center,
              style: FontUtilities.style(
                fontSize: 25,
                fontColor: VariableUtilities.theme.black,
                fontWeight: FWT.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: '_',
                hintStyle: FontUtilities.style(
                  fontSize: 25,
                  fontColor: VariableUtilities.theme.gray,
                  fontWeight: FWT.bold,
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ).toList(),
      ),
    );
  }
}
