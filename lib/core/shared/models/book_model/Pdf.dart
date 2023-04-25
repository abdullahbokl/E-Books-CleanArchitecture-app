import 'dart:convert';

/// isAvailable : false

Pdf pdfFromJson(String str) => Pdf.fromJson(json.decode(str));
String pdfToJson(Pdf data) => json.encode(data.toJson());
class Pdf {
  Pdf({
      this.isAvailable,});

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }
  bool? isAvailable;
Pdf copyWith({  bool? isAvailable,
}) => Pdf(  isAvailable: isAvailable ?? this.isAvailable,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }

}