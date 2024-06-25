class Epub {
  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  Epub.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
  }

  bool? isAvailable;
  String? acsTokenLink;
}
