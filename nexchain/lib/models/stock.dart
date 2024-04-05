

import 'package:nexchain/models/raw_material.dart';

class Stock {
  int? stockId;
  RawMaterial? rawMaterial;
  double? previousPrice;
  double? unitPrice;
  int? quantity;
  DateTime? lastStockUpdateDate;
  double? increase;
  double? decrease;

  Stock({
    this.stockId,
    this.rawMaterial,
    this.previousPrice,
    this.unitPrice,
    this.quantity,
    this.lastStockUpdateDate,
    this.increase,
    this.decrease,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      stockId: json['stockId'],
      rawMaterial: RawMaterial.fromJson(json['rawMaterial']),
      previousPrice: json['previousPrice'],
      unitPrice: json['unitPrice'],
      quantity: json['quantity'],
      lastStockUpdateDate: DateTime.parse(json['lastStockUpdateDate']),
      increase: json['increase'],
      decrease: json['decrease'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stockId': stockId,
      'rawMaterial': rawMaterial?.toJson(),
      'previousPrice': previousPrice,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'lastStockUpdateDate': lastStockUpdateDate?.toIso8601String(),
      'increase': increase,
      'decrease': decrease,
    };
  }
}