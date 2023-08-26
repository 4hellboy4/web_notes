import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed,
    required this.obscureFlag,
    required this.textInputType,
    required this.controller,
  }) : super(key: key);

  final String name;
  final IconData? icon;
  final TextInputType? textInputType;
  final void Function()? onPressed;
  final bool obscureFlag;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          height: 60,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscureFlag,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: name,
              hintText: "Введите $name",
              contentPadding: const EdgeInsets.only(left: 15),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 5,
                ),
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(icon),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
