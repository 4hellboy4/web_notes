import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_web/constants/colors.dart';
import 'package:notes_web/firebase/authentication.dart';
import 'package:notes_web/providers/notes_provider.dart';
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
    return Consumer<NotesProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Center(
              //gsv132005@gmail.com
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Заметки",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.exit_to_app, size: 30, color: Colors.black,),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseFunctions().signOutFirebase(context);
              print(Provider.of<SignUpProvider>(context, listen: false).isSignedUp
                  ? "true"
                  : "false");
              GoRouter.of(context).go(MyRouter.login);
            },
          ),
        );
      },
    );
  }
}
