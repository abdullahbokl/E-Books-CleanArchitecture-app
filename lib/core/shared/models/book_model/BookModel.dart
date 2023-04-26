import '../../entities/book_entity/book_entity.dart';
import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'AccessInfo.dart';
import 'dart:convert';

import 'search_info.dart';

/// kind : "books#volume"
/// id : "zyTCAlFPjgYC"
/// etag : "f0zKg75Mx/I"
/// selfLink : "https://www.googleapis.com/books/v1/volumes/zyTCAlFPjgYC"
/// volumeInfo : {"title":"The Google story","authors":["David A. Vise","Mark Malseed"],"publisher":"Random House Digital, Inc.","publishedDate":"2005-11-15","description":"\"Here is the story behind one of the most remarkable Internet\n  successes of our time. Based on scrupulous research and extraordinary access\n  to Google, ...","industryIdentifiers":[{"type":"ISBN_10","identifier":"055380457X"},{"type":"ISBN_13","identifier":"9780553804577"}],"pageCount":207,"dimensions":{"height":"24.00 cm","width":"16.03 cm","thickness":"2.74 cm"},"printType":"BOOK","mainCategory":"Business & Economics / Entrepreneurship","categories":["Browsers (Computer programs)","..."],"averageRating":3.5,"ratingsCount":136,"contentVersion":"1.1.0.0.preview.2","imageLinks":{"smallThumbnail":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api","thumbnail":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","small":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api","medium":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api","large":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=4&edge=curl&source=gbs_api","extraLarge":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=6&edge=curl&source=gbs_api"},"language":"en","infoLink":"https://books.google.com/books?id=zyTCAlFPjgYC&ie=ISO-8859-1&source=gbs_api","canonicalVolumeLink":"https://books.google.com/books/about/The_Google_story.html?id=zyTCAlFPjgYC"}
/// saleInfo : {"country":"US","saleability":"FOR_SALE","isEbook":true,"listPrice":{"amount":11.99,"currencyCode":"USD"},"retailPrice":{"amount":11.99,"currencyCode":"USD"},"buyLink":"https://books.google.com/books?id=zyTCAlFPjgYC&ie=ISO-8859-1&buy=&source=gbs_api"}
/// accessInfo : {"country":"US","viewability":"PARTIAL","embeddable":true,"publicDomain":false,"textToSpeechPermission":"ALLOWED_FOR_ACCESSIBILITY","epub":{"isAvailable":true,"acsTokenLink":"https://books.google.com/books/download/The_Google_story-sample-epub.acsm?id=zyTCAlFPjgYC&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"},"pdf":{"isAvailable":false},"accessViewStatus":"SAMPLE"}

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          title: volumeInfo!.title!,
          image: volumeInfo.imageLinks?.thumbnail ?? '',
          authorName: volumeInfo.authors?.first ?? '',
          price: saleInfo?.retailPrice?.amount,
          rating: volumeInfo.averageRating,
          bookId: id ?? '',
          ratingCount: volumeInfo.ratingsCount,
          previewLink: volumeInfo.previewLink ?? '',
          categories: volumeInfo.categories ?? [],
        );

  factory BookModel.fromJson(dynamic json) => BookModel(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
      );

  BookModel copyWith({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
    SaleInfo? saleInfo,
    AccessInfo? accessInfo,
    SearchInfo? searchInfo,
  }) =>
      BookModel(
        kind: kind ?? this.kind,
        id: id ?? this.id,
        etag: etag ?? this.etag,
        selfLink: selfLink ?? this.selfLink,
        volumeInfo: volumeInfo ?? this.volumeInfo,
        saleInfo: saleInfo ?? this.saleInfo,
        accessInfo: accessInfo ?? this.accessInfo,
        searchInfo: searchInfo ?? this.searchInfo,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      etag,
      selfLink,
      volumeInfo,
      saleInfo,
      accessInfo,
      searchInfo,
    ];
  }
}
