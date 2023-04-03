import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:hamro_patro/model/nepali_event_model.dart';

import '../constants/asset_list.dart';

class LoadJsonData {
  static Future getYearlyEventData() async {
    List list = [];
    String jsonData = await rootBundle.loadString(AssetList.yearJson);
    Map data = jsonDecode(jsonData);
    // List listData = data['yearLst'] as List;
    list = await data['yearLst'].map((e) => YearLst.fromJson(e)).toList();
    // for (int i = 0; i < listData.length; i++) {
    //   log("json format year data => ${jsonEncode(listData[i])}");
    //   // list.add(
    //   //   YearLst.fromJson(listData[i]),
    //   // );
    // }
    log("json raw list => ${jsonEncode(list)}");
    return list;
  }
}