


import 'package:flutter/material.dart';
import 'package:nexchain/models/ingredient.dart';
import 'package:nexchain/models/recipe.dart';
import 'package:nexchain/services/recipe_service.dart';
import 'package:nexchain/widgets/ingredient_form_field.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final RecipeService _recipeService = RecipeService();
  final _formKey = GlobalKey<FormState>();
  String? _selectedProduct;
  final List<Ingredient> _ingredients = [];
  final List<String> _rawMaterials = ['Material 1', 'Material 2', 'Material 3'];
  final List<String> _productionProducts = ['Product 1', 'Product 2', 'Product 3'];

  void _addIngredient() {
    setState(() {
      _ingredients.add(Ingredient());
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
    });
  }

  void _createRecipe() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final recipe = Recipe(
        recipeId: 0, // You can generate a unique ID or get it from the server
        product: _selectedProduct,
        ingredients: _ingredients,
      );
      await _recipeService.createRecipe(recipe);
      // Handle success or error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedProduct,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Select Product'),
                items: _productionProducts.map((product) {
                  return DropdownMenuItem(
                    value: product,
                    child: Text(product),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProduct = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Ingredients:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _ingredients.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: IngredientFormField(
                          labelText: 'Name',
                          controller: TextEditingController(
                            text: _ingredients[index].name,
                          ),
                          options: _rawMaterials,
                          onChanged: (value) {
                            setState(() {
                              _ingredients[index].name = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Quantity',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          initialValue: _ingredients[index].quantity?.toString(),
                          onSaved: (value) {
                            _ingredients[index].quantity = int.tryParse(value ?? '');
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => _removeIngredient(index),
                        icon: const Icon(Icons.remove_circle),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addIngredient,
                child: const Text('Add Ingredient'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createRecipe,
                child: const Text('Create Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}