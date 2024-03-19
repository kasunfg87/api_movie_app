import 'package:flutter/material.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';

class CastTile extends StatelessWidget {
  const CastTile({
    super.key,
    required this.castModel,
  });
  final CastModel castModel;

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
              width: 90,
              height: 100,
              'https://media.themoviedb.org/t/p/w600_and_h900_bestv2/${castModel.profilePath}',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
              child:
                  CustomTextLatoSmall(text: castModel.originalName.toString())),
          const SizedBox(
            height: 3,
          ),
          CustomTextLatoSmall(
            text: castModel.character.toString(),
            fontSize: 12,
            textColor: kWhite.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
