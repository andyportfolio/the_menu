import 'package:flutter/material.dart';
import 'package:menupan/model/config.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:menupan/screens/detail/restaurant_screen.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key key,
    this.restaurant,
    this.itemIndex,
    this.press,
  }) : super(key: key);

  final Restaurant restaurant;
  final int itemIndex;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.5),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantScreen(restaurant),
              ),
            );
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                restaurant.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Text('${restaurant.address}  ${restaurant.telephone} '),
          // subtitle: Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     Text(restaurant.address),
          //     Text(restaurant.telephone),
          //   ],
          //),
          leading: CircleAvatar(
            radius: 30.0,
            //backgroundImage: AssetImage(restaurant.image),
            backgroundImage: NetworkImage(
              rootURL + restaurant.image,
            ),
          ),
        ),
      ),
    );
  }
}
