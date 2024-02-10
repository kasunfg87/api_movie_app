import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/releted_movie_tile.dart';

class ReletedMovie extends StatelessWidget {
  const ReletedMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLatoSmall(
          text: 'Related Movies',
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 12,
        ),
        RelatedMovieTile(
          movieImage:
              'https://hd.wallpaperswide.com/thumbs/star_wars_the_last_jedi-t2.jpg',
          movieTitle: '',
        ),
      ],
    );
  }
}
