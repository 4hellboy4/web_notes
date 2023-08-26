import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextErrorWidget extends StatelessWidget {
  const TextErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var padding =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 30.0
                : 100.0;
        var textFontSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 30.0
                : 40.0;
        var size = sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? 60.0
            : 100.0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 50.0),
          child: Column(
            children: <Widget>[
              Text(
                "4 0 4",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold, fontSize: size),
              ),
              const SizedBox(height: 20),
              Text(
                "Something went wrong...",
                style: TextStyle(
                  fontSize: textFontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
