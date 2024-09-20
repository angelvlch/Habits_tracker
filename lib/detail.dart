// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:habit_tracker/main.dart';

class Detail extends StatelessWidget {
  final int index;
  const Detail({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    int percent =
        (habits2[index]['daysCompleted'] / habits2[index]['aim'] * 100).toInt();
    return Scaffold(
      backgroundColor: const Color(0xff131b26),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        habits2[index]['title'],
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          splashFactory: InkRipple.splashFactory,
                          customBorder: const CircleBorder(),
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color.fromARGB(145, 158, 158, 158),
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(145, 158, 158, 158),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${habits2[index]['daysCompleted']} from ${habits2[index]['aim']} this week',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 6,
                    valueColor: AlwaysStoppedAnimation(
                      habits2[index]['color'],
                    ),
                    backgroundColor: const Color(0xff1c232d),
                    value: percent / 100,
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Strength',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$percent%',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CircularProgressIndicator(
                        value: percent / 100,
                        valueColor: AlwaysStoppedAnimation(
                          habits2[index]['color'],
                        ),
                        backgroundColor: Colors.grey.shade700,
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ColumnAchievement(
                        subtext: 'Repeat',
                        title: 'Every Day',
                      ),
                      ColumnAchievement(
                        subtext: 'Streak',
                        title: '8 Days',
                      ),
                      ColumnAchievement(
                        subtext: 'Best',
                        title: '11 Days',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnAchievement extends StatelessWidget {
  final String subtext;
  final String title;
  const ColumnAchievement({
    super.key,
    required this.subtext,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtext,
          style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 20,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
