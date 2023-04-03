import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/nepali_event_model.dart';
import '../../pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../utils/load_json.dart';

class CalendarController with ChangeNotifier {
  CalendarController();

  init() async {
    await clear();
  }

  clear() async {
    _currentDate = NepaliDateTime.now().toString().substring(0, 10);
    // await LoadJsonData.getYearlyEventData();
    // notifyListeners();
  }

  late List<YearLst> _eventList = [];

  List<YearLst> get eventList => _eventList;

  set getEventList(List<YearLst> value) {
    _eventList = value;
    log("events data => ${jsonEncode(_eventList)}");

    notifyListeners();
  }

  late String _currentDate = "";

  String get currentDate => _currentDate;

  late List<Day> _dayData = [];

  List<Day> get dayData => _dayData;

  set getDayData(List<Day> value) {
    _dayData = value;
    notifyListeners();
  }

  late bool _toggleHeader = false;

  bool get toggleHeader => _toggleHeader;

  set getToggleValue(bool value) {
    _toggleHeader = value;
    notifyListeners();
  }
}
