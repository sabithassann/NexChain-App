



import 'package:nexchain/models/procurement.dart';

class Payment {
  int? paymentID;
  Procurement? procurement;
  String? paymentAccount;
  double? paymentAmount;
  DateTime? paymentDate;

  Payment({
    this.paymentID,
    this.procurement,
    this.paymentAccount,
    this.paymentAmount,
    this.paymentDate,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentID: json['paymentID'],
      procurement: json['procurement'] != null
          ? Procurement.fromJson(json['procurement'])
          : null,
      paymentAccount: json['paymentAccount'],
      paymentAmount: json['paymentAmount']?.toDouble(),
      paymentDate: json['paymentDate'] != null
          ? DateTime.parse(json['paymentDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentID': paymentID,
      'procurement': procurement?.toJson(),
      'paymentAccount': paymentAccount,
      'paymentAmount': paymentAmount,
      'paymentDate': paymentDate?.toIso8601String(),
    };
  }
}