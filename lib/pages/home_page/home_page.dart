import 'package:flutter/material.dart';
import 'package:notes_web/pages/home_page/home_page_mobile.dart';
import 'package:notes_web/pages/home_page/home_page_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const HomePageMobile(),
      desktop: (_) => const HomePageWeb(),
    );
  }
}
