import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    required this.headerText,
    required this.detailsText,
  });
  final String headerText, detailsText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLatoSmall(
          text: headerText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        CustomTextLatoSmall(
          text: detailsText,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
