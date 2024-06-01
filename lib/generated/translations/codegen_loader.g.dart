// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "notifications": "Notifications",
    "mark_all_read": "Mark all read",
    "featured": "Featured",
    "readed": "readed",
    "latest_news": "Latest news",
    "time_ago": {
      "day": "{} day ago",
      "days": "{} days ago",
      "day_hour": "{} day and {} hours ago",
      "days_hours": "{} days and {} hours ago",
    },
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"en": en};
}
