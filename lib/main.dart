import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menupan/screens/load_init_page.dart';

import 'constant.dart';

//[FCM]
//https://www.youtube.com/watch?v=pVUIU_nq8MU
//https://github.com/karankharode/Flutter-2.0-Firebase-Push-Notifications
//https://pranavfulkari.com/blogs/flutter/push-notifications-in-flutter-2-0-with-firebase-cloud-messaging-flutter-local-notifications/

//Firebase analytics
//https://dev-yakuza.posstree.com/ko/flutter/firebase/analytics/

//Notification channel for android, this will help in receiving notification
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

//local notifications plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//for handling background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  //print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //to use any service from firebase such as fcm
  await Firebase.initializeApp();

  //it will be called when we receive a background notification.
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //set flutter local notification plugin implementation
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // easylocalization ?????????!
  await EasyLocalization.ensureInitialized();

  // ????????? - https://blog.naver.com/chandong83/222422479689
  // MyApp??? EasyLocalization ??? ?????????.
  runApp(
    EasyLocalization(
        // ?????? ?????? ?????????
        supportedLocales: [Locale('en', 'US'), Locale('ko', 'KR')],
        //path: ?????? ?????? ??????
        path: 'assets/translations',
        //fallbackLocale supportedLocales??? ????????? ????????? ?????? ?????? ???????????? ??????
        fallbackLocale: Locale('en', 'US'),

        //startLocale??? ???????????? ?????? ????????? ????????? ????????? ?????????
        //?????? ??? ????????? ?????? ????????? OS ????????? ?????? ?????? ????????? ?????????
        //startLocale: Locale('ko', 'KR')

        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //setting firebase analytics
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],

      // ??????????????? ????????? ?????? ?????? -// ????????? delegate
      localizationsDelegates: context.localizationDelegates,
      // ???????????? ?????????
      supportedLocales: context.supportedLocales,
      // ????????? ?????????
      locale: context.locale,

      debugShowCheckedModeBanner: false,
      //delete debug mark
      theme: ThemeData(
        //Poppins default font
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FCMSettingPage(),
    );
  }
}

class FCMSettingPage extends StatefulWidget {
  FCMSettingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FCMSettingPage createState() => _FCMSettingPage();
}

class _FCMSettingPage extends State<FCMSettingPage> {

  @override
  void initState() {
    super.initState();

    //foreground notifications ??? ???????????? ???????????? ?????????
    //show a notification using the local notifications plugin
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        //print(message.notification.body);
        showNotification(
            notification.hashCode, notification.title, notification.body);
      }
    });

    // notification bar ??? click ????????? ???????????? ????????? ??? ??????????????? ????????? ??????
    //FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {}
    //In a case where we will click on notification and open the app from terminated or background state,
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //delete debug mark
        theme: ThemeData(
          //Poppins default font
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadInitPage(context.locale.countryCode));
  }
}

void showNotification(int hashCode, String title, String body) {
  //TODO : comment??? ????????? ???????????? ????????????
  flutterLocalNotificationsPlugin.show(
      hashCode,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ));
}
