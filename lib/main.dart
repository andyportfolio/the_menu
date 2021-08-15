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
  print('A bg message just showed up :  ${message.messageId}');
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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //delete debug mark
      title: 'The Menu',
      theme: ThemeData(
        //Poppins default font
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FCMSettingPage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    //foreground notifications 을 받았을때 보여주는 메세지
    //show a notification using the local notifications plugin
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        print("message recieved");
        print(message.notification.body);
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text("Notification"),
        //         content: Text(message.notification.body),
        //         actions: [
        //           TextButton(
        //             child: Text("Ok"),
        //             onPressed: () {
        //               Navigator.of(context).pop();
        //             },
        //           )
        //         ],
        //       );
        //     });
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
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
    });

    // notification bar 를 click 했을때 보여주는 메세지
    //In a case where we will click on notification and open the app from terminated or background state,
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //delete debug mark
      title: 'The Menu',
      theme: ThemeData(
        //Poppins default font
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadInitPage()
    );
  }
}
