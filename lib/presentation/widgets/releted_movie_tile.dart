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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              width: 142,
              height: 106,
              movieImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextLatoSmall(text: movieTitle)
        ],
      ),
    );
  }
}
