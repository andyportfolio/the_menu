import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:menupan/model/foodcategory.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:menupan/screens/restaurant/restaurant_card.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constant.dart';

class RestaurantListScreen extends StatefulWidget {
  RestaurantListScreen(this._categoryId);

  final int _categoryId;

  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen>
    with SingleTickerProviderStateMixin {
  //item size
  final itemSize = 140.0; //120 이면 한화면에 5칸이 나온다. 140 이면 4칸 반 나옴.

  ScrollController _controller;
  TabController _tabController;

  bool isUserClicked = false;

  //현재 선택된 Tab 인덱스
  var currentTabIndex = 0;

  //이전 에 선택된 Tab 인텍스
  var prevTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _tabController = TabController(vsync: this, length: foodcategory.length);

    // //goto category by _categoryId
    currentTabIndex = widget._categoryId;
    _tabController.animateTo(currentTabIndex); //tab 이동

    // 리스트의 이동
    //https://stackoverflow.com/questions/52114535/scrollcontroller-not-attached-to-any-scroll-views
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //write or call your logic
      //code will run when widget rendering complete
      _controller.jumpTo(_getPosition(currentTabIndex)); //list 이동
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  //스크롤 되면서 Tab을 이동 시켜야 한다.
  _scrollListener() {
    //스크롤 되
    int num = _controller.offset ~/ itemSize; //120

    //사용자가 탭을 클릭해서 움직인게 아니라면, 즉 스크롤링해서 움직일 경우에는
    //Tab을 이동시켜야 한다.
    if (isUserClicked) {
      //do nothing
    } else {
      setState(() {
        currentTabIndex = restaurants[num].category_id;
        _tabController.animateTo(restaurants[num].category_id);
      });
    }
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      //"Scroll Start";
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      //Scroll Update";
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    //스크롤이 멈추면 사용자가 클릭한 flag를 초기화 시킨다.
    isUserClicked = false;

    setState(() {
      //"Scroll End";
    });
  }

  double _getPosition(int currentIndex) {
    var offsetItemCount = 0;

    for (var i = 0; i < restaurants.length; i++) {
      if (restaurants[i].category_id == currentIndex) {
        offsetItemCount = i;
        break;
      }
    }

    return (offsetItemCount * itemSize).toDouble();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: foodcategory.length,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text('appTitle').tr(),
          centerTitle: false,
          bottom: TabBar(
            // unselectedLabelColor: Colors.white,
            // indicator: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.orange),
            onTap: (index) {
              //사용자가 Tab을 클릭했다.
              isUserClicked = true;

              prevTabIndex = currentTabIndex;
              currentTabIndex = index;

              if (prevTabIndex != currentTabIndex) {
                _controller.animateTo(_getPosition(currentTabIndex),
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500));
              }
            },
            controller: _tabController,
            isScrollable: true,
            tabs: List.generate(
                foodcategorytabs.length, (index) => foodcategorytabs[index]),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        //print('ScrollStartNotification');
                        _onStartScroll(scrollNotification.metrics);
                      } else if (scrollNotification
                          is ScrollUpdateNotification) {
                        _onUpdateScroll(scrollNotification.metrics);
                      } else if (scrollNotification is ScrollEndNotification) {
                        _onEndScroll(scrollNotification.metrics);
                      }
                      return true;
                    },
                    child: ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      //스크롤이 가능한 객체안에 다시스크롤이 있는경우 설정함
                      itemCount: restaurants.length,
                      itemExtent: itemSize,
                      itemBuilder: (context, index) => RestaurantCard(
                        restaurant: restaurants[index],
                        itemIndex: index,
                        press: () {},
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
