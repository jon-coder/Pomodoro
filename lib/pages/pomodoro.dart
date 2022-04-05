import 'package:flutter/material.dart';
import 'package:pomodoro/components/time_in.dart';
import 'package:pomodoro/components/timer.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

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
              children: [
                TimeIn(
                  title: 'Work',
                  value: store.workTimer,
                  dec: store.decrementWorkTimer,
                  inc: store.incrementWorkTimer,
                ),
                TimeIn(
                  title: 'Rest',
                  value: store.restTime,
                  dec: store.decrementRestTimer,
                  inc: store.incrementRestTimer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
