import 'dart:convert';

/// amount : 11.99
/// currencyCode : "USD"

RetailPrice retailPriceFromJson(String str) => RetailPrice.fromJson(json.decode(str));
String retailPriceToJson(RetailPrice data) => json.encode(data.toJson());
class RetailPrice {
  RetailPrice({
      this.amount, 
      this.currencyCode,});

  RetailPrice.fromJson(dynamic json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }
  num? amount;
  String? currencyCode;
RetailPrice copyWith({  num? amount,
  String? currencyCode,
}) => RetailPrice(  amount: amount ?? this.amount,
  currencyCode: currencyCode ?? this.currencyCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['currencyCode'] = currencyCode;
    return map;
  }

}