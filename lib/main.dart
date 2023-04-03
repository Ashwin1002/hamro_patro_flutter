import 'package:flutter/material.dart';
import 'package:hamro_patro/screen/my_calendar/calendar_controller.dart';
import 'package:hamro_patro/screen/my_calendar/my_nepali_calendar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarController())
      ],
      child: MaterialApp(
        title: 'Hamro Patro Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const MyNepaliCalendar(),
      ),
    );
  }
}
