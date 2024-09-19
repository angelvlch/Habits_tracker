import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit trackers',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131b26),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: ' Most Popuar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: '  Habits',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 91, 9, 255),
                  boxShadow: [
                    const BoxShadow(
                      color: Color.fromARGB(255, 91, 9, 255),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView.builder(
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 15, top: 9, bottom: 9),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: habits[index]['color'],
                          boxShadow: [
                            BoxShadow(
                              color: habits[index]['color'],
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              habits[index]['title'],
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              habits[index]['fulltext'],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 90,
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
              decoration: const BoxDecoration(
                color: Color(0xff1b232e),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  int day = DateTime.now().day + index;
                  bool isToday = DateTime.now().day == day;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FittedBox(
                      child: Container(
                        // alignment: Alignment.center,
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isToday
                              ? const Color(0xff727be8)
                              : const Color(0xff131b26),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${DateTime.now().day + index}',
                              style: TextStyle(
                                color: isToday
                                    ? Colors.white
                                    : Colors.blueGrey.shade500,
                                fontSize: 20,
                                fontWeight: isToday
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Text(
                              DateFormat('EE').format(
                                DateTime.now().add(
                                  Duration(days: index),
                                ),
                              ),
                              style: TextStyle(
                                color: isToday
                                    ? Colors.white
                                    : Colors.blueGrey.shade500,
                                fontWeight: isToday
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Your Habits',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '  5',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: habits2.length,
                itemBuilder: (context, index) {
                  return HabitCard(index: index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  final int index;

  const HabitCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDone = habits2[index]['aim'] == habits2[index]['daysCompleted'];
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone ? habits2[index]['color'] : Colors.transparent,
                  border: isDone
                      ? const Border()
                      : Border.all(
                          color: Colors.grey.shade400,
                        ),
                ),
                child: Icon(
                  Icons.done,
                  color: isDone ? Colors.white : Colors.grey.shade400,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habits2[index]['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '${habits2[index]['daysCompleted']} from ${habits2[index]['aim']} this week',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 17,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            minHeight: 6,
            valueColor: AlwaysStoppedAnimation(
              habits2[index]['color'],
            ),
            backgroundColor: const Color(0xff1c232d),
            value: habits2[index]['daysCompleted'] / habits2[index]['aim'],
          )
        ],
      ),
    );
  }
}

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
    'aim': 5,
    'title': 'Learn 5 new words',
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
