import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeIn extends StatelessWidget {
  final String title;
  final int value;
  final Function? inc;
  final Function? dec;

  const TimeIn({
    Key? key,
    required this.title,
    required this.value,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.oxygen(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => inc,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                primary: Colors.red,
              ),
              child: const Icon(
                Icons.arrow_upward,
                size: 16,
              ),
            ),
            Text(
              '$value min',
              style: GoogleFonts.oxygen(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () => dec,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                primary: Colors.red,
              ),
              child: const Icon(
                Icons.arrow_downward,
                size: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
