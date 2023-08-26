import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_web/constants/colors.dart';
import 'package:notes_web/widgets/auth_text_field/auth_text_field.dart';
import 'package:notes_web/widgets/my_button/my_button.dart';

class AuthPageMobile extends StatefulWidget {
  const AuthPageMobile({Key? key}) : super(key: key);

  @override
  _AuthPageMobileState createState() => _AuthPageMobileState();
}

class _AuthPageMobileState extends State<AuthPageMobile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatedPasswordController =
      TextEditingController();

  @override
  void initState() {
    _emailController;
    _passwordController;
    _repeatedPasswordController;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatedPasswordController.dispose();
    super.dispose();
  }

  Future singUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: _key,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Регистрация",
                      style: GoogleFonts.rubik(
                        fontSize: 40,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                AuthTextField(
                  name: "Email",
                  textController: _emailController,
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  flag: false,
                ),
                AuthTextField(
                  name: "Пароль",
                  textController: _passwordController,
                  icon: Icons.password,
                  textInputType: TextInputType.visiblePassword,
                  flag: false,
                ),
                AuthTextField(
                  name: "Пароль еще раз",
                  textController: _repeatedPasswordController,
                  icon: Icons.password,
                  textInputType: TextInputType.visiblePassword,
                  flag: true,
                ),
                const SizedBox(height: 15),
                MyButton(
                  label: "Готово",
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      singUp();
                    }
                  },
                  width: 150,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
