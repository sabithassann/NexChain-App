import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nexchain/models/product_warehouse.dart';

class ProductWarehouseService {
  final String apiUpdateUrl = 'http://localhost:8084';

  Future<List<ProductWareHouse>> getAllWareDetails() async {
    final response = await http.get(Uri.parse('$apiUpdateUrl/allWareDetails'));
    if (response.statusCode == 200) {
      List<dynamic> wareDetailsJson = jsonDecode(response.body);
      return wareDetailsJson
          .map((json) => ProductWareHouse.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load warehouse details');
    }
  }
}