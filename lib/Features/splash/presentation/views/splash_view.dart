import 'package:boklo_ebook/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/images.dart';
import '../widgets/sliding_text.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppImages.imagesLogo),
          SizedBox(height: AppDimensions.height10),
          const SlidingText(),
        ],
      ),
    );
  }
}
