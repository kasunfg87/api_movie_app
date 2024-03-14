import 'package:flutter/material.dart';

class RelatedMovieTile extends StatelessWidget {
  const RelatedMovieTile({
    super.key,
    required this.movieImage,
  });
  final String movieImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              // height: 170,
              width: 110,
              movieImage,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
