import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieUtilities {
  static LottieBuilder loadingIndicator01() => Lottie.asset(
        'assets/lottie/loading_01.json',
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      );
  static LottieBuilder loadingIndicator02() => Lottie.asset(
        'assets/lottie/loading_02.json',
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      );
}
