import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/review_tile.dart';
import 'package:provider/provider.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, value, child) {
        return value.reviews.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextLatoSmall(
                    text: ' Reviews ',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: value.reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ReviewTile(model: value.reviews[index]),
                      );
                    },
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
