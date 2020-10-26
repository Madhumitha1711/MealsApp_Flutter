import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilter;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters,this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _veagn = false;
  var _lactoseFree = false;


@override
  void initState() {
    _glutenFree=widget.currentFilters['gluten'];
    _vegetarian=widget.currentFilters['vegetarian'];
    _veagn=widget.currentFilters['veagn'];
    _lactoseFree=widget.currentFilters['lactose'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilter({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'veagn': _veagn,
                'vegetarian': _vegetarian,
              });
              Navigator.of(context).pushNamed('/');
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust meal Selection'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                  title: Text('Gluten Free'),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                  title: Text('Lactose Free'),
                ),
                SwitchListTile(
                  value: _veagn,
                  onChanged: (val) {
                    setState(() {
                      _veagn = val;
                    });
                  },
                  title: Text('Vegan'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                  title: Text('Vegetarian'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
