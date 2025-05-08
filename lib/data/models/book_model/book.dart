class Book {
  final String id;
  final String title;
  final String author;
  final String thumbnail;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.thumbnail,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? 'No Title',
      author: json['volumeInfo']['authors']?.join(', ') ?? 'Unknown Author',
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
    );
  }
}