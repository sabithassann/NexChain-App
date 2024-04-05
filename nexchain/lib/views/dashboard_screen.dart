import 'package:flutter/material.dart';
import 'package:nexchain/widgets/dashboard_option.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepPurple, // Change the appBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade200, Colors.purple.shade600],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16),
          childAspectRatio: 1.5,
          children: [
            DashboardOption(
              iconPath: 'images/supplier.png',
              title: 'Add Supplier',
              onTap: () {
                Navigator.pushNamed(context, '/supplier');
              },
            ),
            DashboardOption(
              iconPath: 'images/rawmaterial.png',
              title: 'Add RawMaterial',
              onTap: () {
                Navigator.pushNamed(context, '/rawmaterial');
              },
            ),
            DashboardOption(
              iconPath: 'images/procurement.png',
              title: 'Payment Info',
              onTap: () {
                Navigator.pushNamed(context, '/paymentinfo');
              },
            ),
            DashboardOption(
              iconPath: 'images/stock.png',
              title: 'StockDetails',
              onTap: () {
                Navigator.pushNamed(context, '/stock');
              },
            ),
            DashboardOption(
              iconPath: 'images/warestatus.png',
              title: 'WareHouse Status',
              onTap: () {
                Navigator.pushNamed(context, '/warestatus');
              },
            ),
            DashboardOption(
              iconPath: 'images/menu.png',
              title: 'Menu Bar',
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
            DashboardOption(
              iconPath: 'images/employee.png',
              title: 'Employee List',
              onTap: () {
                Navigator.pushNamed(context, '/employee');
              },
            ),
            DashboardOption(
              iconPath: 'images/scan.png',
              title: 'Scanner',
              onTap: () {
                Navigator.pushNamed(context, '/scan');
              },
            ),
          ],
        ),
      ),
    );
  }
}