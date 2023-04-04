import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants/asset_list.dart';
import '../../../pkg/clean_nepali_calendar/clean_nepali_calendar.dart';
import '../../../widgets/container_decoration.dart';
import '../../../widgets/widget_space.dart';

class UpcomingDaysList extends StatelessWidget {
  const UpcomingDaysList({
    super.key,
    required this.currentDate,
  });
  final NepaliDateTime currentDate;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: CustomDecoration.customBoxDecoration(
          backgroundColor: Colors.grey.withAlpha(80),
          borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Text(
                  "आगमी दिनहरु ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              )
            ],
          ),
          verticalSpace(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: size.width * 0.85,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: CustomDecoration.customBoxDecoration(
                      backgroundColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: Colors.grey, width: 0.2)),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        decoration: CustomDecoration.customBoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              bottomLeft: Radius.circular(6.0)),
                          decorationImage: const DecorationImage(
                            image: AssetImage(AssetList.hamroPatroCover),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      horizontalSpace(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  NepaliDateFormat("MMMM dd", Language.nepali)
                                      .format(currentDate),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "आज",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.5),
                                ),
                              ],
                            ),
                            verticalSpace(height: 6),
                            const Text(
                              "सोम प्रदोस ब्रत/SEE २०७९-अनिवर्य नेपाली",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3),
                            ),
                            verticalSpace(height: 2),
                            Text(
                              DateFormat("y MMM dd").format(DateTime.now()),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          verticalSpace(),
        ],
      ),
    );
  }
}