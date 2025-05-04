class Author {
  String? key;
  String? name;

  Author({this.key, this.name});

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(key: json['key'] as String?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'key': key, 'name': name};
}
