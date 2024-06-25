class Dimensions {
  Dimensions({
    this.height,
    this.width,
    this.thickness,
  });

  Dimensions.fromJson(dynamic json) {
    height = json['height'];
    width = json['width'];
    thickness = json['thickness'];
  }

  String? height;
  String? width;
  String? thickness;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['width'] = width;
    map['thickness'] = thickness;
    return map;
  }
}
