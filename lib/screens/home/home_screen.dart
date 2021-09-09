
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:menupan/screens/home/eventpage.dart';
import 'package:menupan/screens/home/notice.dart';

import '../../constant.dart';
import 'homepage.dart';

class HomeScreen extends StatefulWidget {
  final String versionStatus;

  HomeScreen({this.versionStatus});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<HomeScreen> {
  var _index = 0;
  var _pages = [HomePage(),EventPage(),Notice()];

  @override
  void initState() {
    super.initState();
    print('version status in home screen:  ${widget.versionStatus}');

    //Recommend -- 알림만 보여줌
    if (widget.versionStatus == 'R') {
      //showNotification(hashCode,title,body);
      Future.delayed(Duration.zero, () {
        //Update -- Update 페이지로 강제 이동하기
        _showUpdateAlert();
      });
    } else if (widget.versionStatus == 'U') {

      Future.delayed(Duration.zero, () {
        //Update -- Update 페이지로 강제 이동하기
        _showForceUpdateAlert();
      });
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('appTitle').tr(),
        centerTitle: false,
      ),
      body: _pages[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: kPrimaryColor,
          selectedItemColor: kSelectedItemColor,
          unselectedItemColor: kUnselectedItemColor,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('BottomNavigationBarItem1').tr(),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('BottomNavigationBarItem3').tr(),
              icon: Icon(Icons.event),
            ),
            BottomNavigationBarItem(
              title: Text('BottomNavigationBarItem2').tr(),
              icon: Icon(Icons.notifications_active),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateAlert() {
    showDialog(
        context: context,
        barrierDismissible: false, //  다이얼로그 바깥에 닫히지 않
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("updateRecommendTitle").tr(),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text("updateRecommendBody").tr()],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
                //TODO : update 하는 deep link 로 이동하기.
              },
                  child: Text("updateBtn").tr()),
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
              },
                  child: Text("updateLaterBtn").tr())
            ],
          );
        }
    );
  }

  void _showForceUpdateAlert() {
    showDialog(
        context: context,
        barrierDismissible: false, //  다이얼로그 바깥에 닫히지 않
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("updateRequiredTitle").tr(),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text("updateRequiredBody").tr()],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
                //TODO : update 하는 deep link 로 이동하기.
              },
                  child: Text("updateBtn").tr())
            ],
          );
        }
    );
  }
}
