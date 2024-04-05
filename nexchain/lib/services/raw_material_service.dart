

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nexchain/models/raw_material.dart';


class RawMaterialService {
  final String baseUrl = 'http://localhost:8084/api/rawmaterials';

  Future<List<RawMaterial>> getAllRawMaterials() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> rawMaterialsJson = jsonDecode(response.body);
      return rawMaterialsJson
          .map((json) => RawMaterial.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load raw materials');
    }
  }

  Future<RawMaterial> addRawMaterial(RawMaterial rawMaterial) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(rawMaterial.toJson()),
    );
    if (response.statusCode == 200) {
      return RawMaterial.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add raw material');
    }
  }

  Future<RawMaterial> updateRawMaterial(
      int id, RawMaterial rawMaterial) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(rawMaterial.toJson()),
    );
    if (response.statusCode == 200) {
      return RawMaterial.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update raw material');
    }
  }

  Future<void> deleteRawMaterial(int id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete raw material');
    }
  }
}