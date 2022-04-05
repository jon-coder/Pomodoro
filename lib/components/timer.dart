import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/components/timer_button.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Time to work!',
            style: GoogleFonts.oxygen(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
            style: GoogleFonts.oxygen(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          Observer(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.isRunning)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TimerButton(
                      title: 'START',
                      icon: Icons.play_arrow,
                      action: store.startTimer,
                    ),
                  ),
                if (store.isRunning)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TimerButton(
                      title: 'STOP',
                      icon: Icons.stop,
                      action: store.stopTimer,
                    ),
                  ),
                TimerButton(
                  title: 'REFRESH',
                  icon: Icons.refresh,
                  action: store.refreshTimer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
