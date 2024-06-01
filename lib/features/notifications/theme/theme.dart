// ignore_for_file: non_constant_identifier_names

import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class NotificationsThemeText {
  TextStyle get titleTextStyle => AppTextStyles.buttonText1;
  TextStyle get actionTextStyle => AppTextStyles.buttonText1;
  TextStyle get cardTitleTextStyle => AppTextStyles.text1;
  TextStyle get cardSubtitleTextStyle => AppTextStyles.text2;
  TextStyle get featuredTitleTextStyle => AppTextStyles.title2.copyWith(
        color: AppColors.white,
      );
  TextStyle get bodyTitleTextStyle => AppTextStyles.title1;
}

final _text = NotificationsThemeText();

final class NotificationsThemeColors {
  Color get iconColor => AppColors.black;
  Color get appBarBackgroundColor => AppColors.gray1;
  Color get scaffoldColor => AppColors.gray1;
  Color get cardFirstColor => AppColors.white;
  Color get cardSecondColor => AppColors.gray1;
  Color get shadowFirstCardColor => AppColors.black.withOpacity(0.1);
  Color get shadowSecondCardColor => AppColors.white;
  Color get loaderShimmerColor => AppColors.gray1;
  Color get loaderBackgroungColor => AppColors.gray2;
}

final _colors = NotificationsThemeColors();

class NotificationsTheme {
  NotificationsThemeColors get color => _colors;
  NotificationsThemeText get text => _text;
}

extension NotificationsStandartTheme on StandartTheme {
  NotificationsTheme get Notifications => NotificationsTheme();
}
