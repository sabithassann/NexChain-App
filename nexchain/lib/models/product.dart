class ProductAn {
  final int id;
  final String productName;
  final DateTime purchaseDate;
  final double price;
  final int quantity;

  ProductAn({
  required this.id,
  required this.productName,
  required this.purchaseDate,
  required this.price,
  required this.quantity
  });

  factory ProductAn.fromJson(Map<String, dynamic> json) {
    return ProductAn(
      id: json['id'],
      productName: json['productName'],
      purchaseDate: DateTime.parse(json['purchaseDate']),
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'purchaseDate': purchaseDate.toIso8601String(),
      'price': price,
      'quantity': quantity,
    };
  }
}
