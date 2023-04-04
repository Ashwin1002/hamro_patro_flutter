import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hamro_patro/constants/asset_list.dart';
import 'package:hamro_patro/pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:hamro_patro/screen/home_page/component/home_appbar.dart';
import 'package:hamro_patro/screen/home_page/component/news_list_screen.dart';
import 'package:hamro_patro/screen/home_page/component/other_service_screen.dart';
import 'package:hamro_patro/utils/routes.dart';
import 'package:hamro_patro/widgets/container_decoration.dart';
import 'package:hamro_patro/widgets/widget_space.dart';

import 'component/home_menu.dart';
import 'component/upcoming_event_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  final _advancedDrawerController = AdvancedDrawerController();

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 4000), vsync: this)..forward()..addListener(() {
      if (animationController.isCompleted) {
        animationController.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    NepaliDateTime currentDate = NepaliDateTime.now();

    final Animation<double> offsetAnimation =
    Tween(begin: 0.0, end: 10.0).chain(CurveTween(curve: Curves.elasticIn)).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });


    final size = MediaQuery.of(context).size;
    return AdvancedDrawer(
      backdropColor: Colors.grey.shade900,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      openRatio: 0.55,
      openScale: 0.9,
      drawer: drawerWidget(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(size.width, 52),
            child: HomeAppBar(
              onDrawerPressed: _handleMenuButtonPressed,
            ),
          ),
          body: Scrollbar(
            radius: const Radius.circular(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, calendarPage);
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        StreamBuilder(
                          stream:
                              Stream.periodic(const Duration(seconds: 1), (i) {
                            currentDate =
                                currentDate.add(const Duration(seconds: 1));
                            return currentDate;
                          }),
                          builder: (context, snapshot) {
                            log("data in seconds => ${snapshot.data}");

                            if (snapshot.hasData) {
                              String currentYear =
                                  NepaliDateFormat("yyyy", Language.nepali)
                                      .format(snapshot.data!);
                              String currentMonth =
                                  NepaliDateFormat("MMMM dd", Language.nepali)
                                      .format(snapshot.data!);
                              String weekDay =
                                  NepaliDateFormat("EEE", Language.nepali)
                                      .format(snapshot.data!);
                              String dayValue =
                                  NepaliDateFormat("aको", Language.nepali)
                                      .format(snapshot.data!);
                              String currentTime =
                                  NepaliDateFormat.Hm(Language.nepali)
                                      .format(snapshot.data!);

                              return Container(
                                width: size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10.0),
                                decoration:
                                    CustomDecoration.customBoxDecoration(
                                        backgroundColor:
                                            Colors.grey.withAlpha(80),
                                        borderRadius: BorderRadius.zero),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "$weekDay, $currentMonth, $currentYear",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    verticalSpace(height: 5.0),
                                    Text(
                                      "$dayValue $currentTime",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    verticalSpace(),
                                    const Text(
                                      "सोम प्रदोस ब्रत/SEE २०७९-अनिवर्य \nनेपाली",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    verticalSpace(),
                                    Row(
                                      children: [
                                        const Text(
                                          "चैत्र सुक्ल द्वदसी",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        horizontalSpace(width: 12),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 2.0),
                                          decoration: CustomDecoration
                                              .customBoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            backgroundColor:
                                                Colors.grey.withAlpha(60),
                                          ),
                                          child: const Text(
                                            "पन्चाङ्ग",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.5),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 25.0, right: 20),
                          child: Column(
                            children: [
                              Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.red.shade400,
                                size: 40,
                              ),
                              verticalSpace(height: 3.5),
                              const Text(
                                "Scan Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.3),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(height: 12.0),
                  UpcomingDaysList(currentDate: currentDate),
                  verticalSpace(height: 12.0),
                  HomeMenuList(offsetAnimation: offsetAnimation),
                  verticalSpace(height: 12.0),
                  NewsListScreen(
                      iconData: Icons.newspaper,
                      title: "Hot Headlines",
                      iconColor: Colors.blue.shade500),
                  verticalSpace(height: 12.0),
                  const OtherServiceScreen(),
                  verticalSpace(height: 12.0),
                  NewsListScreen(
                      iconData: Icons.local_fire_department,
                      title: "Latest News",
                      iconColor: Colors.red.shade800),
                  verticalSpace(height: 12.0),
                  Row(
                    children: [
                      horizontalSpace(width: 8.0),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          decoration: CustomDecoration.customBoxDecoration(
                              backgroundColor: Colors.red.shade500,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                              horizontalSpace(width: 10),
                              const Text(
                                "पात्रो",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.3),
                              )
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(width: 8.0),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          decoration: CustomDecoration.customBoxDecoration(
                              backgroundColor: Colors.red.shade500,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.newspaper_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                              horizontalSpace(width: 10),
                              const Text(
                                "समाचार",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.3),
                              ),
                              horizontalSpace(width: 8.0)
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(width: 8.0),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerWidget() {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 128.0,
              decoration: const BoxDecoration(
                color: Colors.black26,
              ),
              child: Image.asset(
                AssetList.hamroPatroCover,
                fit: BoxFit.cover,
              ),
            ),
            drawerIcon(title: "Kundali", iconData: Icons.square_outlined),
            drawerIcon(title: "Tapaiko Rashfal", iconData: Icons.nightlight),
            drawerIcon(title: "Blog/Sahitya", iconData: Icons.book_outlined),
            drawerIcon(title: "E-Card", iconData: Icons.credit_card),
            drawerIcon(title: "Tirhi, Parba ra Utsab", iconData: Icons.calendar_month_outlined),
            drawerIcon(title: "Sait/Murrat", iconData: Icons.star),
            drawerIcon(title: "Share Bazaar", iconData: Icons.auto_graph),
            drawerIcon(title: "Nepali Binimaya Dar", iconData: Icons.leaderboard),
            drawerIcon(title: "Sun/Chadi Dar", iconData: Icons.diamond_outlined),
            drawerIcon(title: "Tarkari Bazaar", iconData: Icons.fastfood_outlined),
            drawerIcon(title: "Miti Paribartan", iconData: Icons.calendar_today),
            drawerIcon(title: "Ad-Free", iconData: Icons.credit_card),
            drawerIcon(title: "Like Garnuhos", iconData: Icons.thumb_up_off_alt_outlined),
            drawerIcon(title: "Hamro Patro Website", iconData: Icons.web),
            drawerIcon(title: "Subidha Anurodh", iconData: Icons.notifications_on_rounded),
            drawerIcon(title: "Sujhab", iconData: Icons.chat_bubble_sharp),
            drawerIcon(title: "Change Language", iconData: Icons.compare_arrows_rounded),
          ],
        ),
      ),
    );
  }

  Widget drawerIcon({required IconData iconData, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey.shade300,
            size: 22.0,
          ),
          horizontalSpace(width: 15),
          Text(
            title,
            style: TextStyle(
                color: Colors.grey.shade300, fontSize: 13.5, letterSpacing: 0.3),
          )
        ],
      ),
    );
  }
}
