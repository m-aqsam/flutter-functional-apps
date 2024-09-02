import 'package:e_shop/utlis/theme/custom_themes/appbar_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/checkbox_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/chip_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/text_field_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EShopTheme {
  EShopTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ETextTheme.lightTextTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    chipTheme: EChipTheme.lightChipTheme,
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ETextTheme.darkTextTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.darkOutlinedButtonTheme,
    chipTheme: EChipTheme.darkChipTheme,
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
  );
}
