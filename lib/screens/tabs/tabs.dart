import 'package:flutter/material.dart';

import '../categories/categories.dart';
import '../favorites/favorites.dart';
import '../../components/main_drawer.dart';
import '../../models/meal.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;

  Tabs(this.favoriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': Categories(), 'title': 'Categories'},
      {'page': Favorites(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings, color: Colors.black54),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
      ),
      endDrawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColorDark,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
