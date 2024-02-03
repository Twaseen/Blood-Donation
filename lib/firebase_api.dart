import 'package:firebase_messaging/firebase_messaging.dart';


import 'main.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void>initNotifications() async{

    await _firebaseMessaging.requestPermission();

    String vapidKey = "Your_VAPID_Public_Key_Here";
    final fCMToken = await _firebaseMessaging.getToken(vapidKey: vapidKey);

    print('Token: $fCMToken');
  }

}

