import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';

class RelatedMovieTile extends StatelessWidget {
  const RelatedMovieTile({
    super.key,
    required this.movieImage,
    required this.movieTitle,
  });
  final String movieImage, movieTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            width: 142,
            height: 106,
            movieImage,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextLatoSmall(text: movieTitle)
      ],
    );
  }
}
