import 'package:flutter/material.dart';
import 'package:nexchain/services/api_service.dart';
import '../models/product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductAn> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final products = await ApiService().getProducts();
      setState(() {
        _products = products;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                product.productName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Price: \$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Purchase Date: ${product.purchaseDate.toString()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Quantity: ${product.quantity.toString()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'ID: ${product.id.toString()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add any other details you want to display
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
