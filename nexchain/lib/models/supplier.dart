

class Supplier {
  int? supplierID;
  String? supplierName;
  String? supplierCompanyName;
  String? supplierContactInfo;

  Supplier({
    this.supplierID,
    this.supplierName,
    this.supplierCompanyName,
    this.supplierContactInfo,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      supplierID: json['supplierID'],
      supplierName: json['supplierName'],
      supplierCompanyName: json['supplierCompanyName'],
      supplierContactInfo: json['supplierContactInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'supplierID': supplierID,
      'supplierName': supplierName,
      'supplierCompanyName': supplierCompanyName,
      'supplierContactInfo': supplierContactInfo,
    };
  }
}