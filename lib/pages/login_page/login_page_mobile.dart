import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_web/constants/colors.dart';
import 'package:notes_web/firebase/authentication.dart';
import 'package:notes_web/providers/login_provider.dart';
import 'package:notes_web/providers/sign_up_provider.dart';
import 'package:notes_web/router/my_router.dart';
import 'package:notes_web/widgets/login_page_name_label/login_page_name_lable.dart';
import 'package:notes_web/widgets/login_text_field/login_text_field.dart';
import 'package:notes_web/widgets/my_button/my_button.dart';
import 'package:notes_web/widgets/registered_or_guest_block/registered_or_guest_block.dart';
import 'package:provider/provider.dart';

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  _LoginPageMobileState createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  final TextEditingController _usernameEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void goHome() {
    GoRouter.of(context).go(MyRouter.home);
  }

  @override
  void initState() {
    _usernameEmailController;
    _passwordController;
    super.initState();
  }

  @override
  void dispose() {
    _usernameEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SignUpProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const LoginPageNameLable(),
              const SizedBox(height: 100),
              LoginTextField(
                controller: _usernameEmailController,
                name: "Email",
                icon: Icons.cancel,
                textInputType: TextInputType.emailAddress,
                onPressed: () {
                  _usernameEmailController.clear();
                },
                obscureFlag: false,
              ),
              const SizedBox(height: 10),
              LoginTextField(
                controller: _passwordController,
                name: "Пароль",
                icon: Icons.remove_red_eye,
                textInputType: TextInputType.visiblePassword,
                onPressed: Provider.of<LoginProvider>(context, listen: false)
                    .obsecurePassword,
                obscureFlag: Provider.of<LoginProvider>(context, listen: true)
                    .isObsecuredPassword,
              ),
              const SizedBox(height: 10),
              MyButton(
                  label: "Войти",
                  onPressed: () async {
                    FirebaseFunctions().signInEmailPassword(
                      _usernameEmailController.text.trim(),
                      _passwordController.text.trim(),
                      context,
                    );
                    // if (prov.isAuthenticated()) {
                    //   print(prov.isAuthenticated() ? "true" : "false");
                    //   goHome();
                    // }
                    // print(prov.isAuthenticated() ? "true" : "false");
                  },
                  width: 130),
              const SizedBox(height: 40),
              RegisteredOrGuestBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
