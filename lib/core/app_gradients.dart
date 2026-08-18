import 'package:flutter/cupertino.dart';
import 'package:plants_app/core/app_colors.dart';

class AppGradients {
  static const primaryBgGradient = LinearGradient(

      colors: [
        AppColors.whiteColor,
        AppColors.primaryGreenColor],
      stops: [
        0.0,
        1.0
      ],
    begin: .topCenter,
    end: .bottomCenter
  );

  static final cartBgGradient = LinearGradient(

      colors: [
        AppColors.gradientWhiteBgColor,
        AppColors.gradientWhiteBgColor.withValues(alpha: 0.0),
      ],
      stops: [
        0.0,
        1.0
      ],
      begin: .topCenter,
      end: .bottomCenter
  );
}