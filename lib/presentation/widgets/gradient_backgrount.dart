import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, kBlack],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5])),
    ));
  }
}
