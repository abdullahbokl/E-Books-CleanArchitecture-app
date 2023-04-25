import 'dart:convert';

/// height : "24.00 cm"
/// width : "16.03 cm"
/// thickness : "2.74 cm"

Dimensions dimensionsFromJson(String str) => Dimensions.fromJson(json.decode(str));
String dimensionsToJson(Dimensions data) => json.encode(data.toJson());
class Dimensions {
  Dimensions({
      this.height, 
      this.width, 
      this.thickness,});

  Dimensions.fromJson(dynamic json) {
    height = json['height'];
    width = json['width'];
    thickness = json['thickness'];
  }
  String? height;
  String? width;
  String? thickness;
Dimensions copyWith({  String? height,
  String? width,
  String? thickness,
}) => Dimensions(  height: height ?? this.height,
  width: width ?? this.width,
  thickness: thickness ?? this.thickness,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['width'] = width;
    map['thickness'] = thickness;
    return map;
  }

}