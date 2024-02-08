import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';

class GenreButton extends StatelessWidget {
  const GenreButton({
    super.key,
    required this.movieGenre,
    required this.onTap,
  });
  final String movieGenre;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              color: kGray,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: kWhite, width: 0.5)),
          child: CustomTextLatoSmall(text: movieGenre)),
    );
  }
}
