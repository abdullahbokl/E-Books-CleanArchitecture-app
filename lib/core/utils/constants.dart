import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'dimensions.dart';

class AppConstants {
  /// Show dialog
  static AwesomeDialog showAwesomeDialog({
    required BuildContext context,
    required DialogType dialogType,
    required String dialogTitle,
    required String message,
    required Color titleColor,
    Color? textColor,
    String? btnOkText,
    String? btnCancelText,
    VoidCallback? onCancelTap,
    VoidCallback? onOkTap,
    void Function(DismissType)? onDismissCallback,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.bottomSlide,
      title: dialogTitle,
      titleTextStyle: TextStyle(
          color: titleColor,
          fontWeight: FontWeight.bold,
          fontSize: AppDimensions.heightCalculator(20)),
      desc: message,
      descTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: AppDimensions.heightCalculator(16),
        color: textColor,
      ),
      btnOkOnPress: onOkTap,
      onDismissCallback: onDismissCallback,
      btnCancelOnPress: onCancelTap,
      btnOkText: btnOkText,
      btnCancelText: btnCancelText,
    )..show();
  }
}
