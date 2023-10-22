import 'package:alquran_api/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class ThemeDataColor {
  static ThemeData darkColor = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryDarkColor,
      titleTextStyle: AppText.text20.copyWith(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.greyLightColor,
      ),
    ),
  );

  static ThemeData lightColor = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      color: AppColors.whiteColor,
      titleTextStyle: AppText.text20.copyWith(
        color: AppColors.blueColor,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.blueColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.greyLightColor,
      ),
    ),
  );
}
