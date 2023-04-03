import 'package:flutter/material.dart';
import 'package:hamro_patro/widgets/container_decoration.dart';

class CustomTabView extends StatelessWidget {
  final List<String> tabs;
  final bool isScrollable;
  final double? height;
  final double? width;
  final TabController tabController;

  const CustomTabView(
      {Key? key,
      required this.tabs,
      this.isScrollable = false,
      this.height = 200,
      required this.tabController,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        height: height,
        width: width ?? 168,
        decoration: CustomDecoration.customBoxDecoration(
            backgroundColor: Colors.grey.withAlpha(80),
            borderRadius: BorderRadius.circular(6)),
        child: TabBar(
          controller: tabController,
          isScrollable: isScrollable,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.grey),
          labelColor: Colors.white,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12.5,
          ),
          unselectedLabelColor: Colors.white,
          tabs: tabs.map((e) {
            return Tab(text: e);
          }).toList(),
        ),
      ),
    );
  }
}
