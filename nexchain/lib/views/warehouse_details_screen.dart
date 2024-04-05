import 'package:flutter/material.dart';
import 'package:nexchain/models/product_warehouse.dart';
import 'package:nexchain/services/product_warehouse_service.dart';

class WarehouseDetails extends StatefulWidget {
  @override
  _WarehouseDetailsState createState() => _WarehouseDetailsState();
}

class _WarehouseDetailsState extends State<WarehouseDetails> {
  final ProductWarehouseService _productWarehouseService =
  ProductWarehouseService();
  List<ProductWareHouse> _wareDetails = [];

  @override
  void initState() {
    super.initState();
    _loadWareDetails();
  }

  Future<void> _loadWareDetails() async {
    try {
      final wareDetails =
      await _productWarehouseService.getAllWareDetails();
      setState(() {
        _wareDetails = wareDetails;
      });
    } catch (e) {
      print('Error loading warehouse details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Warehouse Status',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Product Name')),
                    DataColumn(label: Text('Batch Number')),
                    DataColumn(label: Text('Quantity')),
                    DataColumn(label: Text('Worker Name')),
                    DataColumn(label: Text('Trucker Name')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: _wareDetails
                      .map(
                        (detail) => DataRow(
                      cells: [
                        DataCell(Text(detail.id.toString())),
                        DataCell(Text(detail.productName ?? '')),
                        DataCell(Text(detail.batchNumber ?? '')),
                        DataCell(Text(detail.quantity.toString())),
                        DataCell(Text(detail.workerName ?? '')),
                        DataCell(Text(detail.truckerName ?? '')),
                        DataCell(
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: detail.status == 'Approved'
                                  ? Colors.green
                                  : detail.status == 'Pending Approval'
                                  ? Colors.orange
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              detail.status ?? '',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
