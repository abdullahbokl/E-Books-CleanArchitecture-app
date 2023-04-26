import 'list_price.dart';
import 'retail_price.dart';
import 'dart:convert';

/// country : "US"
/// saleability : "FOR_SALE"
/// isEbook : true
/// listPrice : {"amount":11.99,"currencyCode":"USD"}
/// retailPrice : {"amount":11.99,"currencyCode":"USD"}
/// buyLink : "https://books.google.com/books?id=zyTCAlFPjgYC&ie=ISO-8859-1&buy=&source=gbs_api"

SaleInfo saleInfoFromJson(String str) => SaleInfo.fromJson(json.decode(str));

String saleInfoToJson(SaleInfo data) => json.encode(data.toJson());

class SaleInfo {
  String? _country;
  String? _saleability;
  bool? _isEbook;
  ListPrice? _listPrice;
  RetailPrice? _retailPrice;
  String? _buyLink;

  String? get country => _country;

  String? get saleability => _saleability;

  bool? get isEbook => _isEbook;

  ListPrice? get listPrice => _listPrice;

  RetailPrice? get retailPrice => _retailPrice;

  String? get buyLink => _buyLink;

  SaleInfo({
    String? country,
    String? saleability,
    bool? isEbook,
    ListPrice? listPrice,
    RetailPrice? retailPrice,
    String? buyLink,
  }) {
    _country = country;
    _saleability = saleability;
    _isEbook = isEbook;
    _listPrice = listPrice;
    _retailPrice = retailPrice;
    _buyLink = buyLink;
  }

  SaleInfo.fromJson(dynamic json) {
    _country = json['country'];
    _saleability = json['saleability'];
    _isEbook = json['isEbook'];
    _listPrice = json['listPrice'] == null
        ? null
        : ListPrice.fromJson(json['listPrice']);
    _retailPrice = json['retailPrice'] != null
        ? RetailPrice.fromJson(json['retailPrice'])
        : null;
    _buyLink = json['buyLink'];
  }

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
    ListPrice? listPrice,
    RetailPrice? retailPrice,
    String? buyLink,
  }) =>
      SaleInfo(
        country: country ?? _country,
        saleability: saleability ?? _saleability,
        isEbook: isEbook ?? _isEbook,
        listPrice: listPrice ?? _listPrice,
        retailPrice: retailPrice ?? _retailPrice,
        buyLink: buyLink ?? _buyLink,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['saleability'] = _saleability;
    map['isEbook'] = _isEbook;
    map['listPrice'] = _listPrice;
    if (_retailPrice != null) {
      map['retailPrice'] = _retailPrice?.toJson();
    }
    map['buyLink'] = _buyLink;
    return map;
  }
}
