import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppStyles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
