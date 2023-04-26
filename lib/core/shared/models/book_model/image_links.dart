import 'dart:convert';

/// smallThumbnail : "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
/// thumbnail : "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
/// small : "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api"
/// medium : "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api"
/// large : "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=4&edge=curl&source=gbs_api"
/// extraLarge : "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=6&edge=curl&source=gbs_api"

ImageLinks imageLinksFromJson(String str) => ImageLinks.fromJson(json.decode(str));
String imageLinksToJson(ImageLinks data) => json.encode(data.toJson());
class ImageLinks {
  ImageLinks({
      this.smallThumbnail, 
      this.thumbnail, 
      this.small, 
      this.medium, 
      this.large, 
      this.extraLarge,});

  ImageLinks.fromJson(dynamic json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    extraLarge = json['extraLarge'];
  }
  String? smallThumbnail;
  String? thumbnail;
  String? small;
  String? medium;
  String? large;
  String? extraLarge;
ImageLinks copyWith({  String? smallThumbnail,
  String? thumbnail,
  String? small,
  String? medium,
  String? large,
  String? extraLarge,
}) => ImageLinks(  smallThumbnail: smallThumbnail ?? this.smallThumbnail,
  thumbnail: thumbnail ?? this.thumbnail,
  small: small ?? this.small,
  medium: medium ?? this.medium,
  large: large ?? this.large,
  extraLarge: extraLarge ?? this.extraLarge,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    map['small'] = small;
    map['medium'] = medium;
    map['large'] = large;
    map['extraLarge'] = extraLarge;
    return map;
  }

}