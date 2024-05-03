import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:readmore/readmore.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.model});

  final ReviewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicture(
                name: model.authorDetails!.username != null
                    ? model.authorDetails!.username.toString()
                    : 'Anonymous',
                radius: 28,
                fontsize: 21,
                random: true,
                img: model.authorDetails!.avatarPath != null
                    ? 'https://image.tmdb.org/t/p/w200/${model.authorDetails!.avatarPath}'
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextLatoSmall(
                      text: model.authorDetails!.username != null
                          ? model.authorDetails!.username.toString()
                          : 'Anonymous',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        CustomTextLatoSmall(
                          text: model.authorDetails!.rating != null
                              ? model.authorDetails!.rating.toString()
                              : '0',
                        ),
                        const SizedBox(width: 10),
                        CustomTextLatoSmall(
                            text: 'On ${DateFormat.yMMMMd().format(
                          DateTime.parse(model.createdAt.toString()),
                        )}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ReadMoreText(
          textAlign: TextAlign.justify,
          model.content.toString(),
          trimLines: 2,
          style: GoogleFonts.lato(color: kWhite),
          trimMode: TrimMode.Line,
          trimCollapsedText: '..Readmore',
          trimExpandedText: '..Readless',
          moreStyle:
              GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: GoogleFonts.lato(
              fontSize: 14, fontWeight: FontWeight.w800, color: kWhite),
        )
      ],
    );
  }
}
