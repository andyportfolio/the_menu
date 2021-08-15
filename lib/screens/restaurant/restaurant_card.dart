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
              Spacer(),
              Text(
                //restaurant.isOpen ? '주문가능' : '주문불가',
                '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        restaurant.isOpen ? FontWeight.bold : FontWeight.bold,
                    fontStyle:
                        restaurant.isOpen ? FontStyle.normal : FontStyle.italic,
                    color: restaurant.isOpen ? Colors.red : Colors.black),
              ),
            ],
          ),
          subtitle: Text('${restaurant.address} ${restaurant.telephone} '),
          // subtitle: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     Text(restaurant.address),
          //     Text(restaurant.telephone),
          //   ],
          // ),
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
