import 'package:go_router/go_router.dart';

import '../../Features/book_details/presentaion/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String bookDetails = '/book-details';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouter.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRouter.bookDetails,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
