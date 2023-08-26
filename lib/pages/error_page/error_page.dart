import 'package:flutter/material.dart';
import 'package:notes_web/widgets/image_error/image_error_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: const TextErrorWidget(),
        ),
      ),
    );
  }
}
