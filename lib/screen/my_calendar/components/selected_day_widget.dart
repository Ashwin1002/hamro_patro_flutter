import 'package:flutter/material.dart';
import 'package:hamro_patro/widgets/widget_space.dart';

class SelectedEventWidget extends StatelessWidget {
  const SelectedEventWidget(
      {Key? key,
        required this.monthYear,
        required this.dayOfMonth,
        required this.weekDay,
        required this.englishDate,
        required this.daysAgo,
        required this.title,
        required this.description,
        required this.venue})
      : super(key: key);

  final String monthYear;
  final String dayOfMonth;
  final String weekDay;
  final String englishDate;
  final String daysAgo;
  final String title;
  final String description;
  final String venue;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpace(width: 4),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  monthYear,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                      fontSize: 11.5,
                      color: Colors.white,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
                Text(
                  dayOfMonth,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                verticalSpace(),
                Text(
                  weekDay,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11,
                    color: Colors.white,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(width: 15),
          Container(
            width: 0.25,
            height: 120.0,
            color: Colors.grey.shade400,
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        englishDate,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 11,
                          color: Colors.white,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        daysAgo,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 11.0,
                          color: Colors.white,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(height: 10.0),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 12.5,
                    color: Colors.white,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(height: 6.0),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11.5,
                    color: Colors.white,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                verticalSpace(height: 6.0),
                Text(
                  venue,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11.5,
                    color: Colors.white,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
