import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

enum filterOption {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOption selectedValue) {
              setState(() {
                if (selectedValue == filterOption.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: filterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: filterOption.All,
              )
            ],
          )
        ],
      ),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}

