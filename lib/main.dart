import 'package:flutter/material.dart';
import 'package:habit_tracker/core/route.dart';
import 'package:habit_tracker/detail.dart';
import 'package:habit_tracker/home.dart';

List<Map<String, dynamic>> habits = [
  {
    'color': Colors.blue,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
  {
    'color': Colors.red,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
  {
    'color': Colors.cyan,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
  {
    'color': Colors.blue,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
  {
    'color': Colors.red,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
  {
    'color': Colors.cyan,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
];

List<Map<String, dynamic>> habits2 = [
  {
    'aim': 7,
    'title': 'Learn 7 new words',
    'color': const Color(0xff7524ff),
    'daysCompleted': 5,
  },
  {
    'aim': 5,
    'title': 'Learn 5 new words',
    'daysCompleted': 1,
    'color': const Color(0xfff03244),
  },
  {
    'aim': 7,
    'title': 'Create an App a day',
    'daysCompleted': 4,
    'color': const Color.fromARGB(255, 255, 226, 34),
  },
  {
    'aim': 6,
    'title': 'Create an App 6 time',
    'daysCompleted': 6,
    'color': const Color(0xff00d5e2),
  }
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, WidgetBuilder> get _routes {
    return {
      Routes.main: (context) => const Home(),
      Routes.detail: (context) =>
          Detail(index: ModalRoute.of(context)!.settings.arguments as int),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit trackers',
      routes: _routes,
    );
  }
}
