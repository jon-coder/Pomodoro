import 'package:flutter/material.dart';
import 'package:pomodoro/pages/pomodoro.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (context) => PomodoroStore(),
        )
      ],
      child: MaterialApp(
        title: 'Pomodoro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Pomodoro(),
      ),
    );
  }
}
