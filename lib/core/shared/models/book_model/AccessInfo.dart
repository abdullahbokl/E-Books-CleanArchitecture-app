import 'Epub.dart';
import 'Pdf.dart';
import 'dart:convert';

/// country : "US"
/// viewability : "PARTIAL"
/// embeddable : true
/// publicDomain : false
/// textToSpeechPermission : "ALLOWED_FOR_ACCESSIBILITY"
/// epub : {"isAvailable":true,"acsTokenLink":"https://books.google.com/books/download/The_Google_story-sample-epub.acsm?id=zyTCAlFPjgYC&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"}
/// pdf : {"isAvailable":false}
/// accessViewStatus : "SAMPLE"

AccessInfo accessInfoFromJson(String str) => AccessInfo.fromJson(json.decode(str));
String accessInfoToJson(AccessInfo data) => json.encode(data.toJson());
class AccessInfo {
  AccessInfo({
      this.country, 
      this.viewability, 
      this.embeddable, 
      this.publicDomain, 
      this.textToSpeechPermission, 
      this.epub, 
      this.pdf, 
      this.accessViewStatus,});

  AccessInfo.fromJson(dynamic json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = json['epub'] != null ? Epub.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null;
    accessViewStatus = json['accessViewStatus'];
  }
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? accessViewStatus;
AccessInfo copyWith({  String? country,
  String? viewability,
  bool? embeddable,
  bool? publicDomain,
  String? textToSpeechPermission,
  Epub? epub,
  Pdf? pdf,
  String? accessViewStatus,
}) => AccessInfo(  country: country ?? this.country,
  viewability: viewability ?? this.viewability,
  embeddable: embeddable ?? this.embeddable,
  publicDomain: publicDomain ?? this.publicDomain,
  textToSpeechPermission: textToSpeechPermission ?? this.textToSpeechPermission,
  epub: epub ?? this.epub,
  pdf: pdf ?? this.pdf,
  accessViewStatus: accessViewStatus ?? this.accessViewStatus,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['viewability'] = viewability;
    map['embeddable'] = embeddable;
    map['publicDomain'] = publicDomain;
    map['textToSpeechPermission'] = textToSpeechPermission;
    if (epub != null) {
      map['epub'] = epub?.toJson();
    }
    if (pdf != null) {
      map['pdf'] = pdf?.toJson();
    }
    map['accessViewStatus'] = accessViewStatus;
    return map;
  }

}