import 'package:flutter/material.dart';

import 'core/utils/services_locator.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(const BokloEBook());
}

Future<void> _initApp() async {
  configureDependencies();
  await getIt.allReady();
}
