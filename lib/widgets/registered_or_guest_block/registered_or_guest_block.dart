import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_web/router/my_router.dart';

class RegisteredOrGuestBlock extends StatelessWidget {
  RegisteredOrGuestBlock({Key? key}) : super(key: key);

  void goAuthPage(BuildContext context) {
    GoRouter.of(context).go(MyRouter.auth);
  }

  void authAsGuest(BuildContext context) {
    GoRouter.of(context).go(MyRouter.guest);
  }

  final TextStyle defStyle =
      GoogleFonts.nunito(color: Colors.grey, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: "Нет аккаунта? Создать",
            style: defStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => goAuthPage(context),
          ),
        ),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 1.0,
                width: 100.0,
                color: Colors.grey,
              ),
              Text(
                " или ",
                style: defStyle,
              ),
              Container(
                height: 1.0,
                width: 100.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: "Войти как гость",
            style: defStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => authAsGuest(context),
          ),
        ),
      ],
    );
  }
}
