import 'dart:convert';

/// amount : 11.99
/// currencyCode : "USD"

ListPrice listPriceFromJson(String str) => ListPrice.fromJson(json.decode(str));

String listPriceToJson(ListPrice data) => json.encode(data.toJson());

class ListPrice {
  ListPrice({
    this.amount,
    this.currencyCode,
  });

  ListPrice.fromJson(dynamic json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  num? amount;
  String? currencyCode;

  ListPrice copyWith({
    num? amount,
    String? currencyCode,
  }) =>
      ListPrice(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['currencyCode'] = currencyCode;
    return map;
  }
}
