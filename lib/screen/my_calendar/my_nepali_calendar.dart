import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hamro_patro/constants/constant_list.dart';
import 'package:hamro_patro/screen/my_calendar/calendar_controller.dart';
import 'package:hamro_patro/screen/sait_screen/sait_screen.dart';
import 'package:hamro_patro/utils/generate_random.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'package:intl/intl.dart';
import '../../model/nepali_event_model.dart';
import '../../utils/get_days_ago.dart';
import '../../widgets/custom_divider.dart';
import '../../pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../widgets/widget_space.dart';
import 'components/custom_calendar_appbar.dart';
import 'components/selected_day_widget.dart';

class MyNepaliCalendar extends StatefulWidget {
  const MyNepaliCalendar({super.key});

  @override
  State<MyNepaliCalendar> createState() => _MyNepaliCalendarState();
}

class _MyNepaliCalendarState extends State<MyNepaliCalendar>
    with TickerProviderStateMixin {
  CalendarController state = CalendarController();

  final NepaliCalendarController _nepaliCalendarController =
      NepaliCalendarController();

  final ValueNotifier<NepaliDateTime> _selectedDate =
      ValueNotifier(NepaliDateTime.now());

  final ValueNotifier<NepaliDateTime> _selectedMonth =
      ValueNotifier(NepaliDateTime.now());

  String _daysAgo = "";

  bool _dayEquals(NepaliDateTime a, NepaliDateTime b) =>
      a.toIso8601String().substring(0, 10) ==
      b.toIso8601String().substring(0, 10);

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: calendarHeader.length, vsync: this);
    state = Provider.of<CalendarController>(context, listen: false);
    state.init();
  }

  @override
  void dispose() {
    // state.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    state = context.watch<CalendarController>();

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 52),
          child: CustomCalendarAppBar(tabController: tabController),
        ),
        body: LimitedBox(
          maxHeight: size.height,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              LimitedBox(
                maxHeight: size.height,
                child: calendarPreviewWidget(),
              ),
              LimitedBox(
                maxHeight: size.height,
                child: const SaitScreen()
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calendarPreviewWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          verticalSpace(height: 20),
          CleanNepaliCalendar(
            headerDayBuilder: (String weekDay, int index) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    weekDay,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            headerDayType: HeaderDayType.halfName,
            controller: _nepaliCalendarController,
            onHeaderLongPressed: (date) {
              log("header long pressed $date");
            },
            onHeaderTapped: (date) {
              log("header tapped $date");
            },
            calendarStyle: CalendarStyle(
              selectedColor: Colors.grey.shade500,
              dayStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              todayStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
              highlightSelected: true,
              renderDaysOfWeek: true,
              highlightToday: true,
            ),
            headerStyle: const HeaderStyle(
              enableFadeTransition: false,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.5,
              ),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, size: 20),
            ),
            initialDate: NepaliDateTime.now(),
            language: Language.nepali,
            onDaySelected: (day) {
              _selectedDate.value = day;
            },
            // display the english date along with nepali date.
            dateCellBuilder: cellBuilder,
          ),
          const CustomDivider(),
          StickyHeader(
            header: ValueListenableBuilder(
              valueListenable: _selectedDate,
              builder: (context, date, _) {
                _daysAgo = MyDateUtils.nepaliDaysCount(
                        fromDate: state.currentDate, toDate: "$date")
                    .toString();
                return Column(
                  children: [
                    Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectedEventWidget(
                            monthYear: NepaliDateFormat.yMMMM(Language.nepali)
                                .format(_selectedDate.value)
                                .toString(),
                            dayOfMonth: NepaliDateFormat.d(Language.nepali)
                                .format(_selectedDate.value)
                                .toString(),
                            weekDay: NepaliDateFormat.EEEE(Language.nepali)
                                .format(_selectedDate.value)
                                .toString(),
                            englishDate: DateFormat.yMMMMd()
                                .format((_selectedDate.value).toDateTime()),
                            daysAgo: MyDateUtils.daysAgo(daysCount: _daysAgo),
                            title:
                                "विश्व अटिजम जागरुकता दिवस/SEE २०७९-अनिवार्य गणित",
                            description:
                                "चैत शुक्ल द्वादशी (भोलि 0:00:00 बजे सम्म)\nपञ्चाङ्ग: शूल बव मघा",
                            venue:
                                "सूर्योदय: 0:00:00 बजे\nसूर्यास्त: 0:00:00 बजे",
                          ),
                          const CustomDivider()
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(height: 12.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Month Events",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                verticalSpace(height: 8.0),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const CustomDivider();
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      child: Row(
                        children: [
                          horizontalSpace(width: 8),
                          Column(
                            children: [
                              const Text(
                                "चैत्र १९",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              ),
                              verticalSpace(),
                              const Text(
                                "आइतबार",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11.0),
                              ),
                            ],
                          ),
                          horizontalSpace(width: 22),
                          Container(
                            width: 0.25,
                            height: 45,
                            color: Colors.grey.shade500,
                          ),
                          horizontalSpace(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "विश्व अटिजम जागरुकता दिवस/SEE २०७९-अनिवार्य गणित",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400),
                                ),
                                verticalSpace(height: 6.0),
                                const Text(
                                  "चैत शुक्ल द्वादशी (भोलि 0:00:00 बजे सम्म)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2),
                                ),
                                verticalSpace(height: 4.0)
                              ],
                            ),
                          ),
                          const Text(
                            "१९ दिन पहिले",
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.0),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cellBuilder(isToday, isSelected, isDisabled, NepaliDateTime nepaliDate,
      label, text, calendarStyle, isWeekend) {
    Decoration buildCellDecoration() {
      if (isSelected && isToday) {
        return BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.shade700.withOpacity(0.75),
            border: Border.all(color: calendarStyle.selectedColor, width: 2.0));
      }
      if (isSelected) {
        return BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: calendarStyle.selectedColor, width: 2.0));
      } else if (isToday && calendarStyle.highlightToday) {
        return BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue.shade700.withOpacity(0.75),
        );
      } else {
        return BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.transparent),
        );
      }
    }

    return AnimatedContainer(
      margin: const EdgeInsets.all(0.8),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      duration: const Duration(milliseconds: 2000),
      decoration: buildCellDecoration(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: isWeekend ? Colors.red : Colors.white,
              ),
            ),
            // to show events
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: CircleAvatar(
                    radius: 2.3,
                    backgroundColor:
                        nepaliDate.weekday == 7 ? Colors.red : Colors.yellow,
                  ),
                ),
                Text(
                  nepaliDate.toDateTime().day.toString(),
                  style: TextStyle(
                      fontSize: 9.5,
                      color: isWeekend ? Colors.red : Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
