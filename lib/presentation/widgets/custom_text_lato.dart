import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';

class CustomTextLato extends StatelessWidget {
  const CustomTextLato({
    required this.text01,
    required this.text02,
    this.fontColor01 = AppColors.kOrange,
    this.fontColor02 = AppColors.kWhite,
    this.fontSize = 24,
    this.multiColor = false,
    super.key,
  });

  final Color fontColor01;
  final Color fontColor02;
  final bool multiColor;
  final double fontSize;
  final String text01;
  final String text02;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: GoogleFonts.lato(fontSize: fontSize, color: fontColor02),
            children: [
          multiColor
              ? TextSpan(
                  text: text01,
                  style: GoogleFonts.lato(
                    color: fontColor01,
                  ))
              : const TextSpan(),
          TextSpan(
            text: text02,
          )
        ]));
  }
}
