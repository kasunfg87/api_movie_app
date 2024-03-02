import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/releted_movie_tile.dart';
import 'package:provider/provider.dart';

class ReletedMovie extends StatelessWidget {
  const ReletedMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextLatoSmall(
          text: 'Related Movies',
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 12,
        ),
        Consumer<MovieProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(value.movies.length, (index) {
                  return RelatedMovieTile(
                    movieImage:
                        'https://image.tmdb.org/t/p/w500${value.movies[index].backdropPath}',
                    movieTitle: value.movies[index].originalTitle.toString(),
                  );
                }),
              ),
            );
          },
        )
      ],
    );
  }
}
