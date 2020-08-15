import 'package:flutter/material.dart';

import '../../components/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                };

                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      'Gluten-free',
                      'Only include gluten free meals.',
                      _glutenFree, (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  }),
                  _buildSwitchListTile(
                      'Vegetarian',
                      'Only include vegetarian meals.',
                      _vegetarian, (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  }),
                  _buildSwitchListTile(
                      'Lactose-free',
                      'Only include lactose free meals.',
                      _lactoseFree, (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
