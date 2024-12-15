import 'package:flutter/material.dart';
import 'package:spotify_app_clone/core/configs/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )
      )
    )
  );

  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          )
      )
  );

}