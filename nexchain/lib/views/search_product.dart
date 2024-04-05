


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nexchain/models/product.dart';

class ProductViewPage extends StatefulWidget {
  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  late Future<ProductAn?> _productFuture = Future<ProductAn?>.value(null);
  late TextEditingController _productIdController;

  @override
  void initState() {
    super.initState();
    _productIdController = TextEditingController();
  }

  @override
  void dispose() {
    _productIdController.dispose();
    super.dispose();
  }

  Future<ProductAn?> getProductById(int id) async {
    final baseUrl = 'http://localhost:8084/api/products'; // Replace with your actual API base URL
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductAn.fromJson(data);
    } else {
      return null;
    }
  }

  void _fetchProduct() {
    final id = int.tryParse(_productIdController.text);
    if (id != null) {
      setState(() {
        _productFuture = getProductById(id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _productIdController,
              decoration: InputDecoration(
                labelText: 'Product ID',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _fetchProduct,
              child: Text('Fetch Product'),
            ),
            SizedBox(height: 16.0),
            FutureBuilder<ProductAn?>(
              future: _productFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.data == null) {
                  return Center(
                    child: Text('Product not found'),
                  );
                } else {
                  final product = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product ID: ${product.id}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Product Name: ${product.productName}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Purchase Date: ${product.purchaseDate}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Product Price: \$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Quantity: ${product.quantity}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}