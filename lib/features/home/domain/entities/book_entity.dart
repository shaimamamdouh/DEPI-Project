import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? author;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final double? rating;

  @HiveField(5)
  final String? previewLink; 

  BookEntity({
    this.image,
    this.title,
    this.author,
    this.description,
    this.rating,
    this.previewLink,
  });
}
