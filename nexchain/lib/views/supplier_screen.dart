import 'package:flutter/material.dart';
import 'package:nexchain/models/supplier.dart';
import 'package:nexchain/services/supplier_service.dart';

class SupplierScreen extends StatefulWidget {
  @override
  _SupplierScreenState createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  final SupplierService _supplierService = SupplierService();
  late Future<List<Supplier>> _supplierListFuture;

  @override
  void initState() {
    super.initState();
    _supplierListFuture = _supplierService.getAllSuppliers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suppliers'),
      ),
      body: FutureBuilder<List<Supplier>>(
        future: _supplierListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final suppliers = snapshot.data!;
            return ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (context, index) {
                final supplier = suppliers[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(supplier.supplierName ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(supplier.supplierCompanyName ?? ''),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteSupplier(supplier.supplierID);
                      },
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load suppliers'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddSupplierDialog();
        },
      ),
    );
  }

  void _showAddSupplierDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Supplier'),
          content: SupplierForm(
            onSubmit: (supplier) {
              _addSupplier(supplier);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _addSupplier(Supplier supplier) async {
    try {
      final addedSupplier = await _supplierService.addSupplier(supplier);
      setState(() {
        _supplierListFuture = _supplierService.getAllSuppliers();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Supplier added successfully')),
      );
    } catch (e) {
      _supplierListFuture = _supplierService.getAllSuppliers();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add supplier: $e')),
      );
    }
  }

  void _deleteSupplier(int? id) async {
    if (id != null) {
      try {
        await _supplierService.deleteSupplier(id);
        setState(() {
          _supplierListFuture = _supplierService.getAllSuppliers();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Supplier deleted successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete supplier: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid supplier ID')),
      );
    }
  }
}

class SupplierForm extends StatefulWidget {
  final Function(Supplier) onSubmit;

  SupplierForm({required this.onSubmit});

  @override
  _SupplierFormState createState() => _SupplierFormState();
}

class _SupplierFormState extends State<SupplierForm> {
  final _formKey = GlobalKey<FormState>();
  final Supplier _supplier = Supplier();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Supplier Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter supplier name';
              }
              return null;
            },
            onSaved: (value) {
              _supplier.supplierName = value;
            },
          ),
          SizedBox(height: 12),
          TextFormField(
            decoration: InputDecoration(labelText: 'Company Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter company name';
              }
              return null;
            },
            onSaved: (value) {
              _supplier.supplierCompanyName = value;
            },
          ),
          SizedBox(height: 12),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contact Info'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter contact info';
              }
              return null;
            },
            onSaved: (value) {
              _supplier.supplierContactInfo = value;
            },
          ),
          SizedBox(height: 12),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit(_supplier);
              }
            },
          ),
        ],
      ),
    );
  }
}
