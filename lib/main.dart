import 'package:easy_localization/easy_localization.dart';
import 'package:era_test/core/config/core.dart';
import 'package:era_test/generated/translations/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en')],
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      useOnlyLangCode: true,
      child: const Core(),
    ),
  );
}
