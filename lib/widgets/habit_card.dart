import 'package:flutter/material.dart';
import 'package:habit_tracker/main.dart';

class HabitCard extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  const HabitCard({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDone = habits2[index]['aim'] == habits2[index]['daysCompleted'];
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 24),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          onTap: onTap,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isDone ? habits2[index]['color'] : Colors.transparent,
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
        ),
      ),
    );
  }
}
