

import 'package:nexchain/models/procurement.dart';
import 'package:nexchain/models/raw_material.dart';

class Inventory {
  int? inventoryID;
  RawMaterial? rawMaterial;
  int? quantityInStock;
  double? unitPrice;
  DateTime? lastStockUpdateDate;
  Procurement? procurement;

  Inventory({
    this.inventoryID,
    this.rawMaterial,
    this.quantityInStock,
    this.unitPrice,
    this.lastStockUpdateDate,
    this.procurement,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      inventoryID: json['inventoryID'],
      rawMaterial: RawMaterial.fromJson(json['rawMaterial']),
      quantityInStock: json['quantityInStock'],
      unitPrice: json['unitPrice'],
      lastStockUpdateDate: DateTime.parse(json['lastStockUpdateDate']),
      procurement: Procurement.fromJson(json['procurement']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inventoryID': inventoryID,
      'rawMaterial': rawMaterial?.toJson(),
      'quantityInStock': quantityInStock,
      'unitPrice': unitPrice,
      'lastStockUpdateDate': lastStockUpdateDate?.toIso8601String(),
      'procurement': procurement?.toJson(),
    };
  }
}