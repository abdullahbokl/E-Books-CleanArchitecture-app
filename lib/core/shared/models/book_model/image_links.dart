class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

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
