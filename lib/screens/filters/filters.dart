import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Filters extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function saveFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState() {
    super.initState();

    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).primaryColor,
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildSwitchListTile(
              'Gluten-free', 'Only include gluten free meals.', _glutenFree,
              (newValue) {
            setState(
              () {
                _glutenFree = newValue;
              },
            );
          }),
          _buildSwitchListTile(
              'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
              (newValue) {
            setState(
              () {
                _vegetarian = newValue;
              },
            );
          }),
          _buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
              (newValue) {
            setState(
              () {
                _vegan = newValue;
              },
            );
          }),
          _buildSwitchListTile(
              'Lactose-free', 'Only include lactose free meals.', _lactoseFree,
              (newValue) {
            setState(
              () {
                _lactoseFree = newValue;
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                };

                widget.saveFilters(selectedFilters);

                Fluttertoast.showToast(
                  msg: "Your filters have been saved!",
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
