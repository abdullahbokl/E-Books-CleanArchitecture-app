import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/colors.dart';
import 'core/utils/dimensions.dart';
import 'core/utils/router.dart';

class BokloEBook extends StatelessWidget {
  const BokloEBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          _screenSize(context);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Boklo Ebook',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColors.primaryColor,
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme,
              ),
            ),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}

_screenSize(BuildContext context) {
  AppDimensions.screenWidth = MediaQuery.of(context).size.width;
  AppDimensions.screenHeight = MediaQuery.of(context).size.height;
}
