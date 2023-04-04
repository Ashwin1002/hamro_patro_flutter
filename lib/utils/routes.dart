import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamro_patro/screen/home_page/home_page.dart';
import 'package:hamro_patro/screen/my_calendar/my_nepali_calendar.dart';

const String homePage = "HomePage";
const String calendarPage = "CalendarPage";

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case calendarPage:
        return CupertinoPageRoute(builder: (_) => const MyNepaliCalendar());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Error",
          style: TextStyle(color: Colors.white),
        )),
        body: const Center(
          child: Text(
            "Error",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
