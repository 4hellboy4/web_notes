import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestPageLabel extends StatelessWidget {
  const GuestPageLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "БЛОКНОТ",
          style: GoogleFonts.nunito(
              color: Colors.black, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
