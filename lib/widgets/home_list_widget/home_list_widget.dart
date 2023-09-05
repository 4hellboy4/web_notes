import 'package:flutter/material.dart';
import 'package:notes_web/constants/colors.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({
    super.key,
    required this.name,
    required this.time,
    required this.text,
  });

  final String name;
  final DateTime time;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text('text'),
    );
  }
}
