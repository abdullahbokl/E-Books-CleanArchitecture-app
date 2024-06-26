import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'book_entity.g.dart';

// flutter packages pub run build_runner build

@HiveType(typeId: 0)
class BookEntity extends Equatable {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num? ratingCount;
  @HiveField(7)
  final String? previewLink;
  @HiveField(8)
  final List<String>? categories;

  const BookEntity({
    required this.bookId,
    required this.title,
    required this.image,
    required this.authorName,
    required this.price,
    required this.rating,
    this.ratingCount,
    this.previewLink,
    this.categories,
  });

  @override
  List<Object?> get props => [
        bookId,
        title,
        image,
        authorName,
        price,
        rating,
        ratingCount,
        previewLink,
        categories,
      ];
}
