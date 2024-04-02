import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/personal_details.dart';
import 'package:styled_divider/styled_divider.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    super.key,
    required this.knownFor,
    required this.knownCredits,
    required this.gender,
    required this.birthDay,
  });

  final String knownFor, knownCredits, gender, birthDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextLatoSmall(
          text: 'Personal Info',
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          width: SizeConfig.w(context) / 2.5,
          child: const StyledDivider(
            color: kWhite,
            height: 15,
            thickness: 0.20,
            lineStyle: DividerLineStyle.solid,
            indent: 0,
            endIndent: 0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        PersonalDetails(
          headerText: 'Known For',
          detailsText: knownFor,
        ),
        PersonalDetails(
          headerText: 'Known Credits',
          detailsText: knownCredits,
        ),
        PersonalDetails(
          headerText: 'Gender',
          detailsText: gender,
        ),
        PersonalDetails(
          headerText: 'Birthday',
          detailsText: birthDay,
        ),
      ],
    );
  }
}
