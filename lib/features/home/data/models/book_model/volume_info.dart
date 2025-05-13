class VolumeInfo {
  String? title;
  List<String>? authors;
  String? description;
  num? averageRating;
  String? previewLink;
  ImageLinks? imageLinks;

  VolumeInfo({
    this.title,
    this.authors,
    this.description,
    this.averageRating,
    this.previewLink,
    this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String?,
    authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
    description: json['description'] as String?,
    averageRating: json['averageRating'] as num?,
    previewLink: json['previewLink'] as String?,
    imageLinks: json['imageLinks'] == null
        ? null
        : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    'description': description,
    'averageRating': averageRating,
    'previewLink': previewLink,
    'imageLinks': imageLinks?.toJson(),
  };
}

class ImageLinks {
  String? thumbnail;

  ImageLinks({this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    thumbnail: json['thumbnail'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'thumbnail': thumbnail,
  };
}