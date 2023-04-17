import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/router.dart';

class SlidingText extends StatefulWidget {
  const SlidingText({Key? key}) : super(key: key);

  @override
  State<SlidingText> createState() => _SlidingTextState();
}

class _SlidingTextState extends State<SlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
    _navigateToHome(context);
  }

  void _initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 5),
      end: const Offset(0, 0),
    ).animate(animationController);

    animationController.forward();
  }

  _navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      GoRouter.of(context).push(AppRouter.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "Read to learn, grow, and discover",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
