import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  const CalcButton(
      {super.key,
      required this.callback,
      required this.text,
      this.textSize = 28,
      this.bgcolor = const Color.fromARGB(255, 142, 94, 231)});
  final Function callback;
  final String text;
  final double textSize;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: TextButton(
          onPressed: () => {
            callback(text)
          },
          style: TextButton.styleFrom(
            backgroundColor: bgcolor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            textStyle: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
