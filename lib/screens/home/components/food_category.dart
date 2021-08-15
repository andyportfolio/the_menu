import 'package:flutter/material.dart';
import 'package:menupan/model/config.dart';
import 'package:menupan/screens/restaurant/restaurantlist_screen.dart';

class FoodCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 3,
      padding: const EdgeInsets.all(4),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(0),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(1),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(2),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(3),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu4.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(4),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu5.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(5),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu6.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(6),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu7.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(7),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu8.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantListScreen(8),
              ),
            );
          },
          child: GridTile(
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      rootURL + 'menu/menu9.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
