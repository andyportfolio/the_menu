import 'package:flutter/material.dart';
import 'package:menupan/model/config.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:menupan/screens/detail/restaurant_screen.dart';

import '../../constant.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({
    Key key,
    this.restaurant,
    this.itemIndex,
    this.press,
  }) : super(key: key);

  final Restaurant restaurant;
  final int itemIndex;
  final Function press;

  final String faceURL = rootURL + 'restaurant/images/';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.5),
      child: Card(
        elevation: 5,
        shadowColor: kPrimaryColor,
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
          //subtitle: Text('${restaurant.address}  ${restaurant.telephone} '),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(restaurant.main,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      color: kPrimaryColor, fontStyle: FontStyle.italic)),
              Text(
                restaurant.address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Text(
                restaurant.telephone,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 30.0,
            //backgroundImage: AssetImage(restaurant.image),
            backgroundImage: NetworkImage(
              faceURL + restaurant.restaurant_code.toString() + '.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
