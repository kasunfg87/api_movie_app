import 'package:flutter/material.dart';

class RelatedMovieTile extends StatelessWidget {
  const RelatedMovieTile({
    super.key,
    required this.movieImage,
  });
  final String movieImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            height: 150,
            width: 110,
            movieImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
