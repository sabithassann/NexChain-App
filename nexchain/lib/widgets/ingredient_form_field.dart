


import 'package:flutter/material.dart';

class IngredientFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final List<String> options;
  final Function(String?) onChanged;

  const IngredientFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: controller.text.isNotEmpty ? controller.text : null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          hint: const Text('Select Material'),
          items: options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}