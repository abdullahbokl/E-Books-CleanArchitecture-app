import 'package:hive/hive.dart';

import '../shared/entities/book_entity/book_entity.dart';

saveBooksLocally({
  required List<BookEntity> booksList,
  required String boxName,
}) async {
  var box = Hive.box(boxName);

  box.put(boxName, booksList);
}