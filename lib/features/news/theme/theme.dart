// ignore_for_file: non_constant_identifier_names

import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class NewsThemeText {
  TextStyle get textStyle => AppTextStyles.text1;
  TextStyle get titleTextStyle => AppTextStyles.title2.copyWith(
        color: AppColors.white,
      );
}

final _text = NewsThemeText();

final class NewsThemeColors {
  Color get iconColor => AppColors.white;
  Color get appBarBackgroundColor => AppColors.gray1;
  Color get scaffoldColor => AppColors.gray1;
  Color get loaderShimmerColor => AppColors.gray1;
  Color get loaderBackgroungColor => AppColors.gray2;
}

final _colors = NewsThemeColors();

class NewsTheme {
  NewsThemeColors get color => _colors;
  NewsThemeText get text => _text;
}

extension NewsStandartTheme on StandartTheme {
  NewsTheme get News => NewsTheme();
}
