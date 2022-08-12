import 'package:flutter/material.dart';
import './fav_screen.dart';
import './categories_screen.dart';

class TabsScreenup extends StatefulWidget {
  @override
  _TabsScreenupState createState() => _TabsScreenupState();
}

class _TabsScreenupState extends State<TabsScreenup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavScreen(),
          ],
        ),
      ),
    );
  }
}
