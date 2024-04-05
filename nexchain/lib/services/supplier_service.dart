

import 'dart:convert';

import 'package:nexchain/models/supplier.dart';
import 'package:http/http.dart' as http;

class SupplierService {
  static const baseUrl = 'http://localhost:8084/api/supplier';

  Future<List<Supplier>> getAllSuppliers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Supplier.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load suppliers');
    }
  }

  Future<Supplier> addSupplier(Supplier supplier) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: json.encode(supplier.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      final dynamic jsonResponse = json.decode(response.body);
      return Supplier.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to add supplier');
    }
  }

  Future<Supplier> updateSupplier(Supplier supplier) async {
    final url = '$baseUrl/${supplier.supplierID}';
    final response = await http.put(
      Uri.parse(url),
      body: json.encode(supplier.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      return Supplier.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to update supplier');
    }
  }

  Future<void> deleteSupplier(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete supplier');
    }
  }
}