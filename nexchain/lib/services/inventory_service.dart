
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nexchain/models/inventory.dart';
import 'package:nexchain/models/stock.dart';



class InventoryService {
  static const String baseUrl = 'http://localhost:8084/api/inventory';

  Future<Inventory> saveInventory(Inventory inventory) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      body: jsonEncode(inventory.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Inventory.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to save inventory');
    }
  }

  Future<List<Inventory>> getInventoryDetails() async {
    final response = await http.get(Uri.parse('$baseUrl/inventory-details'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Inventory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch inventory details');
    }
  }

  Future<List<Stock>> getStockDetails() async {
    final response = await http.get(Uri.parse('$baseUrl/stock-details'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Stock.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch stock details');
    }
  }
}