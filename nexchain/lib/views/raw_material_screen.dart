import 'package:flutter/material.dart';
import 'package:nexchain/models/raw_material.dart';
import 'package:nexchain/services/raw_material_service.dart';

class RawMaterialList extends StatefulWidget {
  @override
  _RawMaterialListState createState() => _RawMaterialListState();
}

class _RawMaterialListState extends State<RawMaterialList> {
  final RawMaterialService _rawMaterialService = RawMaterialService();
  List<RawMaterial> _rawMaterials = [];
  bool _isAddingNewRawMaterial = false;
  final _formKey = GlobalKey<FormState>();
  RawMaterial _newRawMaterial = RawMaterial();

  @override
  void initState() {
    super.initState();
    _loadRawMaterials();
  }

  Future<void> _loadRawMaterials() async {
    try {
      final rawMaterials = await _rawMaterialService.getAllRawMaterials();
      setState(() {
        _rawMaterials = rawMaterials;
      });
    } catch (e) {
      print('Error loading raw materials: $e');
    }
  }

  void _toggleAddRawMaterial() {
    setState(() {
      _isAddingNewRawMaterial = !_isAddingNewRawMaterial;
    });
  }

  void _submitNewRawMaterial() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _rawMaterialService.addRawMaterial(_newRawMaterial).then((_) {
        _loadRawMaterials();
        _toggleAddRawMaterial();
      }).catchError((error) {
        print('Error adding raw material: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raw Materials'),
      ),
      body: _isAddingNewRawMaterial
          ? _buildAddRawMaterialForm()
          : _buildRawMaterialList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAddRawMaterial,
        child: Icon(_isAddingNewRawMaterial ? Icons.cancel : Icons.add),
      ),
    );
  }

  Widget _buildRawMaterialList() {
    return ListView.builder(
      itemCount: _rawMaterials.length,
      itemBuilder: (context, index) {
        final rawMaterial = _rawMaterials[index];
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              rawMaterial.materialName ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(rawMaterial.materialType ?? ''),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement delete functionality
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddRawMaterialForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Material Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a material name';
                }
                return null;
              },
              onSaved: (value) {
                _newRawMaterial.materialName = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Material Type'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a material type';
                }
                return null;
              },
              onSaved: (value) {
                _newRawMaterial.materialType = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitNewRawMaterial,
              child: Text('Add Raw Material'),
            ),
          ],
        ),
      ),
    );
  }
}
