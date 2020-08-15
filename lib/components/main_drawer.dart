import 'package:flutter/material.dart';

import '../screens/filters/filters.dart';

class MainDrawer extends StatelessWidget {
  final Map<String, bool> currentFilters;
  final Function saveFilters;

  MainDrawer(this.currentFilters, this.saveFilters);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Image.network(
                'https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-black-meat-western-food-banner-background-image_194600.jpg',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black54,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Solid Meals',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoCondensed',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Filters(currentFilters, saveFilters),
        ],
      ),
    );
  }
}
