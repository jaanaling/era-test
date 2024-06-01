// ignore_for_file: non_constant_identifier_names

import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class CoreThemeColors {
  Color get scaffoldColor => AppColors.white;
}

final _colors = CoreThemeColors();

class CoreTheme {
  CoreThemeColors get color => _colors;
}

extension CoreStandartTheme on StandartTheme {
  CoreTheme get Core => CoreTheme();
}
