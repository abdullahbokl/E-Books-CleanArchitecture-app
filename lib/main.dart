import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/shared/entities/book_entity/book_entity.dart';
import 'core/utils/services_locator.dart';
import 'core/utils/strings.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppStrings.allBooksBox);
  await Hive.openBox<BookEntity>(AppStrings.bestSellerBox);
  setupServiceLocator();
  runApp(const BokloEBook());
}
