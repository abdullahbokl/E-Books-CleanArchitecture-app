import 'book_model_dimensions.dart';
import 'image_links.dart';
import 'industry_identifiers.dart';

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.pageCount,
    this.dimensions,
    this.printType,
    this.mainCategory,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.infoLink,
    this.previewLink,
    this.canonicalVolumeLink,
  });

  VolumeInfo.fromJson(dynamic json) {
    title = json['title'];
    authors = json['authors'] == null ? [] : List<String>.from(json['authors']);
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = [];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers?.add(IndustryIdentifiers.fromJson(v));
      });
    }
    pageCount = json['pageCount'];
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
    printType = json['printType'];
    mainCategory = json['mainCategory'];
    categories =
        json['categories'] != null ? json['categories'].cast<String>() : [];
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
    contentVersion = json['contentVersion'];
    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    infoLink = json['infoLink'];
    previewLink = json['previewLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }

  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  num? pageCount;
  Dimensions? dimensions;
  String? printType;
  String? mainCategory;
  List<String>? categories;
  num? averageRating;
  num? ratingsCount;
  String? contentVersion;
  ImageLinks? imageLinks;
  String? language;
  String? infoLink;
  String? previewLink;
  String? canonicalVolumeLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['authors'] = authors;
    map['publisher'] = publisher;
    map['publishedDate'] = publishedDate;
    map['description'] = description;
    if (industryIdentifiers != null) {
      map['industryIdentifiers'] =
          industryIdentifiers?.map((v) => v.toJson()).toList();
    }
    map['pageCount'] = pageCount;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['printType'] = printType;
    map['mainCategory'] = mainCategory;
    map['categories'] = categories;
    map['averageRating'] = averageRating;
    map['ratingsCount'] = ratingsCount;
    map['contentVersion'] = contentVersion;
    if (imageLinks != null) {
      map['imageLinks'] = imageLinks?.toJson();
    }
    map['language'] = language;
    map['infoLink'] = infoLink;
    map['previewLink'] = previewLink;
    map['canonicalVolumeLink'] = canonicalVolumeLink;
    return map;
  }
}
