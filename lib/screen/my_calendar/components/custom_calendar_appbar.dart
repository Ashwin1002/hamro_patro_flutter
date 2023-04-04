import 'package:flutter/material.dart';
import 'package:hamro_patro/constants/constant_list.dart';
import 'package:hamro_patro/constants/constant_text.dart';
import 'package:hamro_patro/screen/my_calendar/calendar_controller.dart';
import 'package:provider/provider.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_tabview.dart';
import '../../../widgets/widget_space.dart';

class CustomCalendarAppBar extends StatelessWidget {
  const CustomCalendarAppBar({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 0.2)
          )
      ),
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpace(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Text(
                    appName,
                    style: TextStyle(
                        color: Colors.white, fontSize: 14.5, letterSpacing: 0.5),
                  ),
                ),
                horizontalSpace(width: 35.0),
                CustomTabView(
                  isScrollable: false,
                  tabController: tabController,
                  width: 168,
                  height: 28,
                  tabs: calendarHeader,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
