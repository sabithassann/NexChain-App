


import 'package:nexchain/models/raw_material.dart';
import 'package:nexchain/models/supplier.dart';

class Procurement {
  int? id;
  Supplier? supplier;
  RawMaterial? rawMaterial;
  int? quantity;
  double? unitPrice;
  double? totalPrice;
  DateTime? procurementDate;

  Procurement({
    this.id,
    this.supplier,
    this.rawMaterial,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
    this.procurementDate,
  });

  factory Procurement.fromJson(Map<String, dynamic> json) {
    return Procurement(
      id: json['id'],
      supplier: Supplier.fromJson(json['supplier']),
      rawMaterial: RawMaterial.fromJson(json['rawMaterial']),
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
      totalPrice: json['totalPrice'],
      procurementDate: DateTime.parse(json['procurementDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supplier': supplier?.toJson(),
      'rawMaterial': rawMaterial?.toJson(),
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalPrice': totalPrice,
      'procurementDate': procurementDate?.toIso8601String(),
    };
  }
}