import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      AppConstants.showAwesomeDialog(
        context: context,
        message: 'Cannot launch $url',
        dialogTitle: 'Error',
        dialogType: DialogType.error,
        titleColor: Colors.red,
      );
    }
  }
}
