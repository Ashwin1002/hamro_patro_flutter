import 'package:flutter/material.dart';
import 'package:hamro_patro/constants/constant_list.dart';
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

    final state = context.watch<CalendarController>();

    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              horizontalSpace(width: 5),
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  "हाम्रो पात्रो",
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
        const CustomDivider()
      ],
    );
  }
}
