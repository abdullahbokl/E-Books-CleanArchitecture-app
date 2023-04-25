import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/domain/use_cases/fetch_all_books_use_case.dart';
import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'Features/home/presentation/manger/all_books_cubit/all_books_cubit.dart';
import 'Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'core/utils/colors.dart';
import 'core/utils/dimensions.dart';
import 'core/utils/router.dart';
import 'core/utils/services_locator.dart';
import 'package:nested/nested.dart';

class BokloEBook extends StatelessWidget {
  const BokloEBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders(),
      child: MaterialApp(
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
      ),
    );
  }

  List<SingleChildWidget> blocProviders() {
    return [
      BlocProvider(
        create: (context) => AllBooksCubit(
          getIt<FetchAllBooksUseCase>(),
        )..fetchAllBooks(),
      ),
      BlocProvider(
        create: (context) => NewestBooksCubit(
          getIt<FetchNewestBooksUseCase>(),
        )..fetchNewestBooks(),
      ),
    ];
  }

  _screenSize(BuildContext context) {
    AppDimensions.screenWidth = MediaQuery.of(context).size.width;
    AppDimensions.screenHeight = MediaQuery.of(context).size.height;
  }
}

