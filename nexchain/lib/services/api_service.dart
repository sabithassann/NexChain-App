import 'dart:convert';

import 'package:nexchain/models/product.dart';
import 'package:http/http.dart' as http;


class ApiService {

  final String baseUrl = 'http://localhost:8084/api/products';
  // final String baseUrl = 'http://192.168.88.239:8084/api/products';


  Future<List<ProductAn>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((json) => ProductAn.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductAn> getProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductAn.fromJson(data);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<ProductAn> saveProduct(ProductAn product) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return ProductAn.fromJson(data);
    } else {
      throw Exception('Failed to create product');
    }
  }

  Future<ProductAn> updateProduct(ProductAn product) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${product.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductAn.fromJson(data);
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete product');
    }
  }

}
