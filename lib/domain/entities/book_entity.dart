import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> authors;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final double rating;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String readUrl;
  bool isSaved;

  BookEntity({
    required this.title,
    required this.authors,
    required this.image,
    required this.rating,
    required this.description,
    required this.readUrl,
    this.isSaved = false,
  });
}
