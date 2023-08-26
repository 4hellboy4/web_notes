import 'package:flutter/material.dart';
import 'package:notes_web/pages/login_page/login_page_mobile.dart';
import 'package:notes_web/pages/login_page/login_page_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const LoginPageMobile(),
      desktop: (_) => const LoginPageWeb(),
    );
  }
}
