import 'package:readio/features/home/domain/entities/book_entity.dart';

import 'author.dart';
import 'availability.dart';

class BookModel extends BookEntity {
  String? key;
  String? title;
  num? editionCount;
  num? coverId;
  String? coverEditionKey;
  List<String>? subject;
  List<String>? iaCollection;
  bool? printdisabled;
  String? lendingEdition;
  String? lendingIdentifier;
  List<Author>? authors;
  num? firstPublishYear;
  String? ia;
  bool? publicScan;
  bool? hasFulltext;
  Availability? availability;

  BookModel({
    this.key,
    this.title,
    this.editionCount,
    this.coverId,
    this.coverEditionKey,
    this.subject,
    this.iaCollection,
    this.printdisabled,
    this.lendingEdition,
    this.lendingIdentifier,
    this.authors,
    this.firstPublishYear,
    this.ia,
    this.publicScan,
    this.hasFulltext,
    this.availability,
  }) : super(image: 'https://covers.openlibrary.org/b/id/$coverId-M.jpg');

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    key: json['key'] as String?,
    title: json['title'] as String?,
    editionCount: json['edition_count'] as num?,
    coverId: json['cover_id'] as int?,
    coverEditionKey: json['cover_edition_key'] as String?,
    subject: json['subject'] as List<String>?,
    iaCollection: json['ia_collection'] as List<String>?,
    printdisabled: json['printdisabled'] as bool?,
    lendingEdition: json['lending_edition'] as String?,
    lendingIdentifier: json['lending_identifier'] as String?,
    authors:
        (json['authors'] as List<dynamic>?)
            ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
            .toList(),
    firstPublishYear: json['first_publish_year'] as num?,
    ia: json['ia'] as String?,
    publicScan: json['public_scan'] as bool?,
    hasFulltext: json['has_fulltext'] as bool?,
    availability:
        json['availability'] == null
            ? null
            : Availability.fromJson(
              json['availability'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'key': key,
    'title': title,
    'edition_count': editionCount,
    'cover_id': coverId,
    'cover_edition_key': coverEditionKey,
    'subject': subject,
    'ia_collection': iaCollection,
    'printdisabled': printdisabled,
    'lending_edition': lendingEdition,
    'lending_identifier': lendingIdentifier,
    'authors': authors?.map((e) => e.toJson()).toList(),
    'first_publish_year': firstPublishYear,
    'ia': ia,
    'public_scan': publicScan,
    'has_fulltext': hasFulltext,
    'availability': availability?.toJson(),
  };
}
