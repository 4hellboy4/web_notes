import 'package:flutter/material.dart';
import 'package:notes_web/constants/colors.dart';
import 'package:notes_web/widgets/guest_page_label/guest_page_label.dart';
import 'package:notes_web/widgets/my_text_field/my_text_field.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
          child: Center(
            child: Column(
              children: <Widget>[
                const GuestPageLabel(),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                const MyTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
