

class ProductWareHouse {
  int? id;
  String? productName;
  String? batchNumber;
  int? quantity;
  String? workerName;
  String? truckerName;
  String? status;

  ProductWareHouse({
    this.id,
    this.productName,
    this.batchNumber,
    this.quantity,
    this.workerName,
    this.truckerName,
    this.status,
  });

  factory ProductWareHouse.fromJson(Map<String, dynamic> json) {
    return ProductWareHouse(
      id: json['id'],
      productName: json['productName'],
      batchNumber: json['batchNumber'],
      quantity: json['quantity'],
      workerName: json['workerName'],
      truckerName: json['truckerName'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'batchNumber': batchNumber,
      'quantity': quantity,
      'workerName': workerName,
      'truckerName': truckerName,
      'status': status,
    };
  }
}