import 'package:flutter/material.dart';
import 'package:notes_web/pages/auth_page/auth_page_mobile.dart';
import 'package:notes_web/pages/auth_page/auth_page_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AuthPageMobile(),
      desktop: (_) => const AuthPageWeb(),
    );
  }
}
