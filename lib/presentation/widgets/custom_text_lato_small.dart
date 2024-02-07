import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';

class CustomTextLatoSmall extends StatelessWidget {
  const CustomTextLatoSmall(
      {super.key,
      required this.text,
      this.textColor = kWhite,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal});
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontWeight: fontWeight,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
