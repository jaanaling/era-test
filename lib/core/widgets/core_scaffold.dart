import 'package:era_test/core/theme/theme.dart';
import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';

var _feature = StandartTheme().Core;

class CoreScaffold extends StatelessWidget {
  final Widget? body;

  const CoreScaffold({
    super.key,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _feature.color.scaffoldColor,
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
