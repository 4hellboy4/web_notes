import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.name,
    required this.icon,
    required this.textInputType,
    required this.textController,
    required this.flag,
  }) : super(key: key);

  final String name;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController textController;
  final bool flag;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double textFieldHeight =
            (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
                ? 70
                : 100;
        return SizedBox(
          height: textFieldHeight,
          child: TextFormField(
            controller: textController,
            keyboardType: textInputType,
            textInputAction: TextInputAction.done,
            obscureText: flag,
            decoration: InputDecoration(
              labelText: name,
              hintText: "В${"ведите $name".toLowerCase()}",
              contentPadding: const EdgeInsets.only(left: 15),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 5,
                ),
                child: Icon(icon),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Заполните поле";
              }
              if (value.length < 4) {
                return "Слишком короткий";
              }
              if (!value.contains("@") && name == "Email") {
                return "Некоректный ввод";
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
