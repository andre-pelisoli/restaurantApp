import 'package:flutter/material.dart';
import 'package:restaurantApp/screens/category_screen.dart';
import 'package:restaurantApp/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedTab = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Categories List', 'screen': CategoryScreen()},
    {'title': 'My Favorites', 'screen': FavoriteScreen()},
  ];

  _selectScren(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedTab]['title']),
      ),
      body: _screens[_selectedTab]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScren,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
