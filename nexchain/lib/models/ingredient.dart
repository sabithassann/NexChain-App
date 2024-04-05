class Ingredient {
  int? ingredientId;
  dynamic recipeId; // You might want to import Recipe class if needed
  String? name;
  int? quantity;
  int? materialId;
  dynamic stock; // You might want to define a Stock class if needed

  Ingredient({
    this.ingredientId,
    this.recipeId,
    this.name,
    this.quantity,
    this.materialId,
    this.stock,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredientId: json['ingredientId'],
      recipeId: json['recipeId'],
      name: json['name'],
      quantity: json['quantity'],
      materialId: json['materialId'],
      stock: json['stock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredientId': ingredientId,
      'recipeId': recipeId,
      'name': name,
      'quantity': quantity,
      'materialId': materialId,
      'stock': stock,
    };
  }
}