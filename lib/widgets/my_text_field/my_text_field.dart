import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_web/constants/colors.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.newline,
      style: GoogleFonts.roboto(
        color: black,
        fontWeight: FontWeight.w600,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
