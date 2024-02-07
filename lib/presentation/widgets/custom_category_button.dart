import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';

class CategoryTextButton extends StatefulWidget {
  const CategoryTextButton({
    required this.buttonText,
    this.isSelected = false,
    super.key,
  });
  final String buttonText;
  final bool isSelected;

  @override
  State<CategoryTextButton> createState() => _CategoryTextButtonState();
}

class _CategoryTextButtonState extends State<CategoryTextButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.buttonText,
          style: GoogleFonts.lato(
            color: widget.isSelected ? kOrange : kWhite,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        widget.isSelected
            ? SvgPicture.asset(AssetConstant.categorySelectLine)
            : const SizedBox()
      ],
    );
  }
}
