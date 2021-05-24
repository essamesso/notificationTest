import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {
  PushNotificationsManager._();
  factory PushNotificationsManager() => _instance;
  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  FirebaseMessaging _firebaseMessaging;
  bool _intialized = false;

  Future<void> init() async {
    if (!_intialized) {
      _firebaseMessaging.requestPermission();
      //_firebaseMessaging.configure();

      String token = await _firebaseMessaging.getToken();
      print(token);
      _intialized = true;
    }
  }
}
