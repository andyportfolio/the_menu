import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menupan/model/config.dart';

import '../../../constant.dart';
import '../adv_webview.dart';

class Advertisement extends StatefulWidget {
  @override
  _AdvertisementState createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  //image size는 800*600 (100kb 수준으)로 jpg 형태로 저장
  List<String> _advImages;

  @override
  void initState() {
    super.initState();

    _advImages = new List<String>();

    setState(() {
      for (var config in configs) {
        if (config.type == 'ADV') {
          _advImages.add(rootURL + config.config1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      margin: EdgeInsets.only(bottom: 5),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items: _advImages.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0), //이미지간 간격
                  child: GestureDetector(
                    onTap: () {
                      var advUrl = findAdvUrl(url);

                      print("advUrl: $advUrl");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdvWebView('광고', advUrl),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
//                       child: Image.asset(
//                         'assets/images/adv.png',
//                         fit: BoxFit.cover,
//                       ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  //webview 로 보여줘야할 url을 return 한다.
  findAdvUrl(String url) {
    for (var config in configs) {
      if (config.type == 'ADV' && url.contains(config.config1)) {
        return rootURL + config.config2;
      }
    }
  }
}
