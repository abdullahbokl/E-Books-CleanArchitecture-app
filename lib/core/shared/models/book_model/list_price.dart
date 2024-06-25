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
}
