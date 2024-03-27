import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/size_config.dart';

class BlurThumbnailImage extends StatelessWidget {
  const BlurThumbnailImage({
    super.key,
    required this.networkImage,
  });
  final String networkImage;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 60,
        sigmaY: 60,
      ),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500$networkImage',
        width: double.infinity,
        height: SizeConfig.h(context) * 0.6,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
