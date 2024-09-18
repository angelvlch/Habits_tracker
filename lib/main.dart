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
      title: 'Habit tracker',
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
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
            SizedBox(height: 20),
            Container(
              height: 120,
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 22),
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
                    padding: EdgeInsets.only(right: 10),
                    child: FittedBox(
                      child: Container(
                        // alignment: Alignment.center,
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color:
                              isToday ? Color(0xff727be8) : Color(0xff131b26),
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
                                fontSize: 25,
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
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
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
                    text: '5',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
