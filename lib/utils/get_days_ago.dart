import 'dart:developer';

import '../pkg/clean_nepali_calendar/clean_nepali_calendar.dart';

class MyDateUtils {
  static int nepaliDaysCount(
      {required String fromDate, required String toDate}) {
    NepaliDateTime from = NepaliDateTime.parse(fromDate.replaceAll("/", "-"));
    NepaliDateTime to = NepaliDateTime.parse(toDate.replaceAll("/", "-"));

    ///
    from = NepaliDateTime(from.year, from.month, from.day);
    to = NepaliDateTime(to.year, to.month, to.day);
    int result = (to.difference(from).inHours / 24).round();

    return result;
  }

  static String daysAgo({required String daysCount}) {
    String result = "";
    if (daysCount == "-1") {
      result = "हिजो";
    } else if (daysCount == "0") {
      result = "आज";
    } else if (daysCount == "1") {
      result = "भोलि";
    } else if (int.parse(daysCount) > 1) {
      result = NepaliUnicode.convert("$daysCount din pachi");
    } else if (int.parse(daysCount) < -1) {
      result = NepaliUnicode.convert("${int.parse(daysCount).abs()} din aghi");
    }
    return result;
  }
}
