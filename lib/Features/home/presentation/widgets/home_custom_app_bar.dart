import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/core/utils/dimensions.dart';
import '/core/utils/images.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.imagesLogo,
          height: AppDimensions.heightCalculator(20),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white,
            size: AppDimensions.heightCalculator(18),
          ),
        ),
      ],
    );
  }
}
