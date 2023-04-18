import 'package:hive/hive.dart';

import '../../../Features/home/domain/entities/book_entity.dart';

saveBooksLocally({
  required List<BookEntity> booksList,
  required String boxName,
}) async {
  var box = Hive.box(boxName);

  box.put(boxName, booksList);
}