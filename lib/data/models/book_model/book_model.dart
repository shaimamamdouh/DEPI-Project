import 'package:readio/domain/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'volume_info.dart';
class BookModel extends BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    required String title,
    required List<String> authors,
    required String image,
    required double rating,
    required String description,
    required String readUrl,
  }) : super(
          title: title,
          authors: authors,
          image: image,
          rating: rating,
          description: description,
          readUrl: readUrl,
        );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volume = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
    final access = json['accessInfo'] != null
        ? AccessInfo.fromJson(json['accessInfo'])
        : null;

    return BookModel(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: volume,
      saleInfo: json['saleInfo'] != null
          ? SaleInfo.fromJson(json['saleInfo'])
          : null,
      accessInfo: access,
      title: volume?.title ?? 'No Title',
      authors: volume?.authors ?? ['Unknown Author'],
      image: (volume?.imageLinks?.thumbnail ?? '')
          .replaceFirst('http://', 'https://'),
      rating: volume?.averageRating?.toDouble() ?? 0.0,
      description: volume?.description ?? 'No Description',
      readUrl: access?.webReaderLink ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
      };
}
