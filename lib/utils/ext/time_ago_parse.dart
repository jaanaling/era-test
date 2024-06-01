import 'package:easy_localization/easy_localization.dart';

String timeAgo(DateTime date) {
  final Duration diff = DateTime.now().difference(date);
  final int days = diff.inDays;
  final int hours = diff.inHours % 24;

  if (days == 1 && hours == 0) {
    return tr('time_ago.day', args: [days.toString()]);
  } else if (days == 1) {
    return tr('time_ago.day_hour', args: [days.toString(), hours.toString()]);
  } else if (days > 1 && hours == 0) {
    return tr('time_ago.days', args: [days.toString()]);
  } else {
    return tr('time_ago.days_hours', args: [days.toString(), hours.toString()]);
  }
}
