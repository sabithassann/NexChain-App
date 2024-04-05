import 'ingredient.dart';

class Recipe {
  int recipeId;
  dynamic product; // You might want to define a Product class if needed
  List<Ingredient> ingredients;

  Recipe({
    required this.recipeId,
    required this.product,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipeId'],
      product: json['product'],
      ingredients: List<Ingredient>.from(
        json['ingredients'].map((x) => Ingredient.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipeId': recipeId,
      'product': product,
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };
  }
}