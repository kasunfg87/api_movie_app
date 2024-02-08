import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/size_config.dart';

class ThumbnailImage extends StatelessWidget {
  const ThumbnailImage({
    super.key,
    required this.networkImage,
  });
  final String networkImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      networkImage,
      width: double.infinity,
      height: SizeConfig.h(context) * 0.6,
      fit: BoxFit.cover,
    );
  }
}
