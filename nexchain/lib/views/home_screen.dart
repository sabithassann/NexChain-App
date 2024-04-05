import 'package:flutter/material.dart';
import 'package:nexchain/components/image_carousel.dart';
import 'package:nexchain/views/add_screen.dart';
import 'package:nexchain/views/create_recipe_screen.dart';
import 'package:nexchain/views/edit_delete_screen.dart';
import 'package:nexchain/views/hero_animation_screen.dart';
import 'package:nexchain/views/inventory_screen.dart';
import 'package:nexchain/views/map_screen.dart';
import 'package:nexchain/views/product_list_screen.dart';
import 'package:nexchain/views/radial_expansion_screen.dart';
import 'package:nexchain/views/search_product.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const appTitle = 'Menu';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'NexChain',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: ImageCarousel(),
          ),
          Center(
            child: _widgetOptions[_selectedIndex],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('NexChain'),
            ),
            ListTile(
              title: const Text('Add Product'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Product List'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Edit Or Delete'),
              selected: _selectedIndex == 2,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductTableScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Search Product'),
              selected: _selectedIndex == 3,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductViewPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Map'),
              selected: _selectedIndex == 4,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Test'),
              selected: _selectedIndex == 5,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroAnimationScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Test 2'),
              selected: _selectedIndex == 6,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RadialScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Test 2'),
              selected: _selectedIndex == 6,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateRecipeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Stock Inventory Details'),
              selected: _selectedIndex == 6,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryScreen()),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}