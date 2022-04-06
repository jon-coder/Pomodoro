import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/pomodoro.dart';
import '../store/store.dart';

void main() => runApp(const PomodoroApp());

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (context) => PomodoroStore(),
        ),
      ],
      child: const MaterialApp(
        title: 'Pomodoro',
        home: Pomodoro(),
      ),
    );
  }
}
