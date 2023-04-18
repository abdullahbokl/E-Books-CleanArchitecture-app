import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/domain/entities/book_entity.dart';
import 'core/utils/strings.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(AppStrings.allBooksBox);
  await Hive.openBox(AppStrings.bestSellerBox);

  runApp(const BokloEBook());
}
