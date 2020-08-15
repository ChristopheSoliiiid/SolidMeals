import 'package:flutter/material.dart';

import '../screens/filters/filters.dart';

class MainDrawer extends StatelessWidget {
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
          Container(
            color: Color.fromRGBO(200, 220, 255, 1),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Solid Meals',
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          }),
        ],
      ),
    );
  }
}
