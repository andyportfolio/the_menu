import 'package:flutter/material.dart';
import 'package:menupan/model/config.dart';
import 'package:menupan/model/foodcategory.dart';
import 'package:menupan/screens/restaurant/restaurantlist_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class FoodCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String menuFile1 = "menu/menu1.jpg";
    String menuFile2 = "menu/menu2.jpg";
    String menuFile3 = "menu/menu3.jpg";
    String menuFile4 = "menu/menu4.jpg";
    String menuFile5 = "menu/menu5.jpg";
    String menuFile6 = "menu/menu6.jpg";
    String menuFile7 = "menu/menu7.jpg";
    String menuFile8 = "menu/menu8.jpg";
    String menuFile9 = "menu/menu9.jpg";

    if (context.locale.countryCode != 'KR') {
      menuFile1 = "menu/menu1_en.jpg";
      menuFile2 = "menu/menu2_en.jpg";
      menuFile3 = "menu/menu3_en.jpg";
      menuFile4 = "menu/menu4_en.jpg";
      menuFile5 = "menu/menu5_en.jpg";
      menuFile6 = "menu/menu6_en.jpg";
      menuFile7 = "menu/menu7_en.jpg";
      menuFile8 = "menu/menu8_en.jpg";
      menuFile9 = "menu/menu9_en.jpg";

      //category도 영문으로 변경한다.
      foodcategorytabs = foodcategorytabs_en;
      foodcategory = foodcategory_en;

    }

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
                      rootURL + menuFile1,
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
                      rootURL + menuFile2,
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
                      rootURL + menuFile3,
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
                      rootURL + menuFile4,
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
                      rootURL + menuFile5,
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
                      rootURL + menuFile6,
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
                      rootURL + menuFile7,
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
                      rootURL + menuFile8,
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
                      rootURL + menuFile9,
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
