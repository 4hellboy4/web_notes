import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_web/constants/colors.dart';
import 'package:notes_web/firebase/authentication.dart';
import 'package:notes_web/providers/sign_up_provider.dart';
import 'package:notes_web/router/my_router.dart';
import 'package:provider/provider.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "u r in",
          style: TextStyle(fontSize: 40, color: black),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        FirebaseFunctions().signOutFirebase(context);
        print(Provider.of<SignUpProvider>(context, listen: false).isSignedUp ? "true" : "false");
        GoRouter.of(context).go(MyRouter.login);
      }),
    );
  }
}
