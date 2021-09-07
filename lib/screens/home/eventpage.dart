import 'package:flutter/material.dart';
import 'package:menupan/model/config.dart';
import 'package:menupan/model/event.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:menupan/screens/detail/restaurant_screen.dart';

import '../../constant.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  //item size
  final itemSize = 250.0;
  final String eventURL = rootURL + 'event/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Expanded(
              child: Container(
                color: Colors.grey[100],
                  child: ListView.builder(
                    shrinkWrap: true,
                    //스크롤이 가능한 객체안에 다시스크롤이 있는경우 설정함
                    itemCount: events.length,
                    itemExtent: itemSize,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.5),
                      child: Card(
                        elevation: 5,
                        shadowColor: kPrimaryColor,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                              image: NetworkImage(
                                eventURL + events[index].image,
                              ),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RestaurantScreen(_getRestaurant(events[index].restaurant_id)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Restaurant _getRestaurant(int restaurant_id) {
    for (var restaurant in restaurants) {
      if (restaurant.restaurant_id == restaurant_id) {
          return restaurant;
      }
    }
  }

}
