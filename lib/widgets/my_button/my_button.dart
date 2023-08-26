import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_web/constants/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  final Function()? onPressed;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: Text(
          label.toUpperCase(),
          style: GoogleFonts.rubik(
            color: white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
