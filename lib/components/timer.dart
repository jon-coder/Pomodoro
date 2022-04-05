import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/components/timer_button.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            '25:00',
            style: GoogleFonts.oxygen(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TimerButton(
                title: 'START',
                icon: Icons.play_arrow,
              ),
              SizedBox(width: 10),
              //TimerButton(
              //title: 'STOP',
              //icon: Icons.stop,
              //),
              SizedBox(width: 10),
              TimerButton(
                title: 'REFRESH',
                icon: Icons.refresh,
              ),
            ],
          )
        ],
      ),
    );
  }
}
