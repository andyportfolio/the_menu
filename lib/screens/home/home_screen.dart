import 'package:flutter/material.dart';
import 'package:menupan/screens/home/event.dart';
import 'package:menupan/screens/home/notice.dart';
import 'homepage.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<HomeScreen> {
  var _index = 0;
  var _pages = [HomePage(), Notice(), Event()];

  @override
  void initState() {
    super.initState();
   }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('The Menu'),
        centerTitle: false,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('초기화면'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('공지사항'),
            icon: Icon(Icons.notifications_active),
          ),
          BottomNavigationBarItem(
            title: Text('이벤트'),
            icon: Icon(Icons.event),
          ),
        ],
      ),
    );
  }
}
