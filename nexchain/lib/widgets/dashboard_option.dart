

import 'package:flutter/material.dart';

class DashboardOption extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  DashboardOption({
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 64,
              height: 64,
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}