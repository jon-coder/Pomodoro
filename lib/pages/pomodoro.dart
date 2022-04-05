import 'package:flutter/material.dart';
import 'package:pomodoro/components/time_in.dart';
import 'package:pomodoro/components/timer.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Timer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                TimeIn(title: 'Work', value: 30),
                TimeIn(title: 'Rest', value: 7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
