

import 'dart:convert';

import 'package:nexchain/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  final String apiUrl = 'http://localhost:8084/recipes';

  Future<List<Recipe>> getAllRecipes() async {
    final response = await http.get(Uri.parse('$apiUrl/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Recipe.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch recipes');
    }
  }

  Future<Recipe> createRecipe(Recipe recipe) async {
    final response = await http.post(
      Uri.parse('$apiUrl/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recipe.toJson()),
    );
    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create recipe');
    }
  }
}