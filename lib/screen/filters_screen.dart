import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routname = '/filters';

  final Function makefilters;

  final Map<String, bool> currentfilters;

  FilterScreen(this.currentfilters, this.makefilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;

  bool _lactoseFree = false;

  bool _vegan = false;

  bool _vegeterian = false;

  @override
  void initState() {
    _glutenFree = widget.currentfilters['gluten'] as bool;
    _lactoseFree = widget.currentfilters['lactose'] as bool;
    _vegan = widget.currentfilters['vegan'] as bool;
    _vegeterian = widget.currentfilters['vegetarian'] as bool;
    super.initState();
  }

  //Widget buildSwitchListTile() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                
                
                final selectedfilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegeterian,
                };
                widget.makefilters(selectedfilters);
              },
            )
          ],
        ),
        drawer: DrawerMain(),
        body: Column(children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meals',
              style: Theme.of(context).textTheme.headline6,
              // textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              SwitchListTile(
                value: _glutenFree,
                title: Text('Gluten-Free'),
                onChanged: (newvalue) {
                  setState(() {
                    _glutenFree = newvalue;
                  });
                },
                subtitle: Text('Only Include Gluten-Free meals.'),
              ),
              SwitchListTile(
                value: _lactoseFree,
                title: Text('Lactose-Free'),
                onChanged: (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                },
                subtitle: Text('Only Include Lactose-Free meals.'),
              ),
              SwitchListTile(
                value: _vegan,
                title: Text('Vegan'),
                onChanged: (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                },
                subtitle: Text('Only Include Vegan meals.'),
              ),
              SwitchListTile(
                value: _vegeterian,
                title: Text('Vegeterian'),
                onChanged: (newvalue) {
                  setState(() {
                    _vegeterian = newvalue;
                  });
                },
                subtitle: Text('Only Include Vegetarian  meals.'),
              ),
            ]),
          )
        ]));
  }
}
