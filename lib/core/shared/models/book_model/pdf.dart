class Pdf {
  Pdf({
    this.isAvailable,
  });

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }

  bool? isAvailable;
}
