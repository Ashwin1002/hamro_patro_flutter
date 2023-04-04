import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../widgets/container_decoration.dart';
import '../../../widgets/widget_space.dart';

class HomeMenuList extends StatelessWidget {
  const HomeMenuList({Key? key, required this.offsetAnimation})
      : super(key: key);

  final Animation<double> offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "हाम्रो सेवाहरु ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
          verticalSpace(height: 15),
          LimitedBox(
            maxHeight: 500,
            child: Align(
              alignment: Alignment.center,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 4.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 1.5),
                        decoration: CustomDecoration.customBoxDecoration(
                            backgroundColor: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(6),
                            border:
                            Border.all(color: Colors.transparent)),
                        child: const Text(
                          'Beta',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.5),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: offsetAnimation,
                        builder: (context, child) {
                          // if (offsetAnimation.value < 0.0) log('${offsetAnimation.value + 8.0}');
                          return Container(
                            padding: EdgeInsets.only(
                                left: offsetAnimation.value + 10.0,
                                right: 10.0 - offsetAnimation.value),
                            child: const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.red,
                              size: 28,
                            ),
                          );
                        },
                      ),
                      verticalSpace(),
                      const Text(
                        "हाम्रो पे",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0),
                      )
                    ],
                  ),
                  menuIconWidget(
                      name: "ज्योतिस",
                      iconData: Icons.temple_hindu_outlined,
                      showToolTip: true,
                      toolTip: "Call"),
                  menuIconWidget(
                      name: "डाक्टर",
                      iconData: Icons.add_location_outlined,
                      showToolTip: true,
                      toolTip: "Call"),
                  menuIconWidget(
                    name: "समाचार",
                    iconData: Icons.newspaper,
                    showToolTip: true,
                    toolTip: "ताजा",
                  ),
                  menuIconWidget(
                      name: "रेडियो", iconData: Icons.radio_outlined),
                  menuIconWidget(
                      name: "रेसीपी",
                      iconData: Icons.emoji_food_beverage_outlined),
                  menuIconWidget(
                      name: "भिडियो",
                      iconData: Icons.play_circle_fill_outlined),
                  menuIconWidget(
                    name: "अडियो",
                    iconData: Icons.audiotrack_outlined,
                  ),
                  menuIconWidget(
                      name: "राशिफल", iconData: Icons.nightlight_outlined),
                  menuIconWidget(
                      name: "कुन्दली", iconData: Icons.square_outlined),
                  menuIconWidget(name: "E-card", iconData: Icons.credit_card),
                  menuIconWidget(
                      name: "बिनिम्य दर",
                      iconData: Icons.currency_exchange_outlined,
                      toolTip: "आजको"),
                  menuIconWidget(
                      name: "सुन/चादी ",
                      iconData: Icons.diamond_outlined,
                      toolTip: "आजको"),
                  menuIconWidget(
                    name: "सेयारबजार",
                    iconData: Icons.auto_graph_outlined,
                  ),
                  menuIconWidget(
                    name: "ब्लग",
                    iconData: Icons.currency_exchange_outlined,
                  ),
                  menuIconWidget(
                    name: "ताली वा गाली",
                    iconData: Icons.library_add_check_outlined,
                  ),
                  menuIconWidget(
                    name: "हाम्रो क्विज",
                    iconData: Icons.quiz_outlined,
                  ),
                  menuIconWidget(
                    name: "पात्रो",
                    iconData: Icons.calendar_month_outlined,
                  ),
                  menuIconWidget(
                      name: "ई-लेअर्निङ", iconData: Icons.school_outlined),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 25,
              spacing: 55,
              runAlignment: WrapAlignment.center,
              children: [],
            ),
          ),
          verticalSpace(height: 25.0),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                horizontalSpace(width: 18),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget menuIconWidget(
      {required String name,
      required IconData iconData,
      bool? showToolTip,
      String? toolTip,
      Color? iconColor}) {
    return Column(
      children: [
        if (showToolTip != null)
          Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.5),
            decoration: CustomDecoration.customBoxDecoration(
                backgroundColor: showToolTip == false
                    ? Colors.transparent
                    : Colors.red.shade400,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.transparent)),
            child: Text(
              toolTip ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 11.5),
            ),
          ),
        Icon(
          iconData,
          color: iconColor ?? Colors.white,
          size: 28,
        ),
        verticalSpace(),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.0),
        )
      ],
    );
  }
}
