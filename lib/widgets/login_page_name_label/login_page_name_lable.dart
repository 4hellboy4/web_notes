import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPageNameLable extends StatelessWidget {
  const LoginPageNameLable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double? fontHeight =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 40.0
                : 60.0;

        return Text(
          "NOTSY",
          style: GoogleFonts.oswald(
            fontSize: fontHeight,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        );
      },
    );
  }
}
