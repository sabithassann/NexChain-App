


import 'package:flutter/material.dart';
import 'package:nexchain/models/employee.dart';

class EmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Page'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/${employees[index].image}'),
            ),
            title: Text(employees[index].name),
            subtitle: Text(employees[index].position),
            onTap: () {
              _showDetails(context, employees[index]);
            },
          );
        },
      ),
    );
  }

  void _showDetails(BuildContext context, Employee employee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(employee.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150, // Adjust the height as needed
                width: 150, // Adjust the width as needed
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/${employee.image}'),
                ),
              ),
              SizedBox(height: 10),
              Text('Position: ${employee.position}'),
              SizedBox(height: 10),
              Text('Email: ${employee.email}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}