import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}
